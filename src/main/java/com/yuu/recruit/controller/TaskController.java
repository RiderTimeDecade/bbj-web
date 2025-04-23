package com.yuu.recruit.controller;

import com.yuu.recruit.domain.Employee;
import com.yuu.recruit.result.PageResult;
import com.yuu.recruit.service.EmployeeBookmarkedService;
import com.yuu.recruit.service.TaskCategoryService;
import com.yuu.recruit.service.TaskService;
import com.yuu.recruit.vo.TaskCategoryVo;
import com.yuu.recruit.vo.TaskVo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

/**
 * 任务控制器
 *
 * @author by yuu
 * @Classname TaskController
 * @Date 2019/10/14 17:18
 * @see com.yuu.recruit.controller
 */
@Controller
@RequestMapping("task")
public class TaskController {

    @Resource
    private TaskService taskService;

    @Resource
    private TaskCategoryService taskCategoryService;

    @Resource
    private EmployeeBookmarkedService employeeBookmarkedService;

    /**
     * 跳转到分类列表页
     *
     * @param categoryId 分类列表页
     * @param key 查询条件
     * @param page
     * @return
     */
    @GetMapping("list")
    public String list(@RequestParam(defaultValue = "0") Long categoryId,
                       @RequestParam(defaultValue = "") String key,
                       @RequestParam(defaultValue = "1") int page,
                       HttpSession session,
                       Model model) {
        // 如果雇员登录了，查询出雇员收藏信息
        Employee employee = (Employee) session.getAttribute("employee");
        List<Long> bookMarkedIds = new ArrayList<>();
        if (employee != null) {
            // 查询雇员收藏信息
            Long employeeId = employee.getId();
            // 查询雇员收藏任务ID集合
            bookMarkedIds = employeeBookmarkedService.getIdsByEmployeeId(employeeId);
        }

        // 查询出所有分类信息，因为选择分类的时候，需要分类信息
        List<TaskCategoryVo> taskCategories = taskCategoryService.getAll();


        // 调用 TaskService 进行分页查询，得到分页结果
        PageResult<TaskVo> tasksPage = taskService.page(categoryId, key, page);

        // 将查询结果放置到域对象中，供页面查询
        model.addAttribute("taskCategories", taskCategories);
        model.addAttribute("tasksPage", tasksPage);
        // 将查询条件页放置到域对象中，方便页面读取
        model.addAttribute("categoryId", categoryId);
        model.addAttribute("key", key);
        model.addAttribute("bookMarkedIds", bookMarkedIds);

        return "task_list";
    }

    /**
     * 跳转到任务详情页
     *
     * @param taskId 任务 ID
     * @return
     */
    @GetMapping("page")
    public String page(@RequestParam(required = true) Long taskId, Model model) {
        // 根据任务 ID 查询出任务详情
        TaskVo taskVo = taskService.getById(taskId);
        // 放入域对象中，提供给页面查询
        model.addAttribute("task", taskVo);
        return "task_page";
    }
    
    /**
     * 下载单个任务
     * 
     * @param taskId 任务ID
     * @param response 响应对象
     */
    @GetMapping("download")
    public void download(@RequestParam Long taskId, HttpServletResponse response) {
        try {
            // 根据任务ID获取任务详情
            TaskVo task = taskService.getById(taskId);
            
            // 检查任务是否存在及是否有下载内容
            if (task == null || task.getTaskResult() == null || task.getTaskResult().trim().isEmpty()) {
                response.setContentType("text/html;charset=utf-8");
                response.getWriter().write("该任务没有可下载的内容");
                return;
            }
            
            // 设置文件名，使用任务描述作为文件名
            String filename = task.getTaskDesc() != null ? task.getTaskDesc() : "task_" + taskId;
            // 替换文件名中的特殊字符
            filename = filename.replaceAll("[\\\\/:*?\"<>|]", "_");
            
            // 设置响应头
            response.setContentType("application/octet-stream");
            response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + ".zip\"");
            
            // 创建ZIP输出流
            ZipOutputStream zipOut = new ZipOutputStream(response.getOutputStream());
            
            // 处理任务结果URL列表
            String[] urls = task.getTaskResult().split(",|;");
            for (int i = 0; i < urls.length; i++) {
                String url = urls[i].trim();
                if (!url.isEmpty()) {
                    // 从URL下载文件并添加到ZIP
                    downloadFileToZip(zipOut, url, "file_" + (i + 1) + getFileExtension(url));
                }
            }
            
            // 完成并关闭ZIP
            zipOut.close();
            
        } catch (Exception e) {
            e.printStackTrace();
            try {
                response.setContentType("text/html;charset=utf-8");
                response.getWriter().write("下载失败：" + e.getMessage());
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
    }
    
    /**
     * 批量下载任务
     * 
     * @param taskIds 任务ID列表，逗号分隔
     * @param response 响应对象
     */
    @GetMapping("batch_download")
    public void batchDownload(@RequestParam String taskIds, HttpServletResponse response) {
        try {
            // 解析任务ID列表
            String[] ids = taskIds.split(",");
            
            // 设置响应头
            response.setContentType("application/octet-stream");
            response.setHeader("Content-Disposition", "attachment; filename=\"batch_tasks.zip\"");
            
            // 创建ZIP输出流
            ZipOutputStream zipOut = new ZipOutputStream(response.getOutputStream());
            
            // 处理每个任务
            for (String idStr : ids) {
                try {
                    Long taskId = Long.parseLong(idStr.trim());
                    TaskVo task = taskService.getById(taskId);
                    
                    if (task != null && task.getTaskResult() != null && !task.getTaskResult().trim().isEmpty()) {
                        // 为每个任务创建一个文件夹
                        String folderName = "task_" + taskId + "_" + 
                                (task.getTaskDesc() != null ? task.getTaskDesc().replaceAll("[\\\\/:*?\"<>|]", "_") : "");
                        
                        // 处理任务结果URL列表
                        String[] urls = task.getTaskResult().split(",|;");
                        for (int i = 0; i < urls.length; i++) {
                            String url = urls[i].trim();
                            if (!url.isEmpty()) {
                                // 从URL下载文件并添加到ZIP中对应任务的文件夹
                                downloadFileToZip(zipOut, url, folderName + "/" + "file_" + (i + 1) + getFileExtension(url));
                            }
                        }
                    }
                } catch (NumberFormatException e) {
                    // 忽略无效的任务ID
                    continue;
                }
            }
            
            // 完成并关闭ZIP
            zipOut.close();
            
        } catch (Exception e) {
            e.printStackTrace();
            try {
                response.setContentType("text/html;charset=utf-8");
                response.getWriter().write("批量下载失败：" + e.getMessage());
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
    }
    
    /**
     * 从URL下载文件并添加到ZIP
     * 
     * @param zipOut ZIP输出流
     * @param fileUrl 文件URL
     * @param entryName ZIP中的条目名称
     * @throws IOException 如果发生IO错误
     */
    private void downloadFileToZip(ZipOutputStream zipOut, String fileUrl, String entryName) throws IOException {
        URL url = new URL(fileUrl);
        URLConnection conn = url.openConnection();
        
        // 添加一个新的ZIP条目
        zipOut.putNextEntry(new ZipEntry(entryName));
        
        // 从URL读取并写入ZIP
        try (InputStream in = conn.getInputStream()) {
            byte[] buffer = new byte[4096];
            int bytesRead;
            while ((bytesRead = in.read(buffer)) != -1) {
                zipOut.write(buffer, 0, bytesRead);
            }
        }
        
        // 完成当前条目
        zipOut.closeEntry();
    }
    
    /**
     * 获取URL的文件扩展名
     * 
     * @param url 文件URL
     * @return 文件扩展名，包括点号（例如".jpg"）
     */
    private String getFileExtension(String url) {
        int lastDotPos = url.lastIndexOf(".");
        if (lastDotPos >= 0) {
            return url.substring(lastDotPos);
        }
        return "";
    }
}
