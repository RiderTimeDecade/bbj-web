package com.yuu.recruit.controller;

import com.yuu.recruit.service.TaskService;
import com.yuu.recruit.vo.TaskVo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URL;
import java.net.URLConnection;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

@Controller
@RequestMapping("task")
public class DownloadControl {
    
    @Resource
    private TaskService taskService;
    
    /**
     * 下载单个任务
     * 
     * @param taskId 任务ID
     * @param response 响应对象
     */
    @GetMapping("download")
    public void download(@RequestParam Long taskId, HttpServletResponse response) {
        ZipOutputStream zipOut = null;
        try {
            // 根据任务ID获取任务详情
            TaskVo task = taskService.getById(taskId);
            
            // 检查任务是否存在及是否有下载内容
            if (task == null || task.getTaskResult() == null || task.getTaskResult().trim().isEmpty()) {
                response.setContentType("text/html;charset=utf-8");
                response.getWriter().write("该任务没有可下载的内容");
                return;
            }
            
            // 设置文件名，使用任务标题作为文件名
            String filename = task.getTaskTitle() != null ? task.getTaskTitle() : "task_" + taskId;
            // 替换文件名中的特殊字符
            filename = filename.replaceAll("[\\\\/:*?\"<>|]", "_");
            
            // 设置响应头，处理中文文件名
            response.setContentType("application/zip");
            response.setCharacterEncoding("UTF-8");
            // 使用RFC5987编码处理中文文件名
            String encodedFilename = java.net.URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
            response.setHeader("Content-Disposition", "attachment; filename=\"" + encodedFilename + ".zip\"; filename*=UTF-8''" + encodedFilename + ".zip");
            
            // 创建ZIP输出流，使用缓冲提高性能
            zipOut = new ZipOutputStream(new BufferedOutputStream(response.getOutputStream()));
            zipOut.setLevel(9); // 最高压缩级别
            
            // 处理任务结果URL列表
            String[] urls = task.getTaskResult().split(",|;");
            for (int i = 0; i < urls.length; i++) {
                String url = urls[i].trim();
                if (!url.isEmpty()) {
                    // 从URL下载文件并添加到ZIP
                    try {
                        downloadFileToZip(zipOut, url, "file_" + (i + 1) + getFileExtension(url));
                    } catch (IOException e) {
                        // 记录错误但继续处理其他文件
                        System.err.println("下载文件失败: " + url + ", 错误: " + e.getMessage());
                    }
                }
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            try {
                response.reset();
                response.setContentType("text/html;charset=utf-8");
                response.getWriter().write("下载失败：" + e.getMessage());
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        } finally {
            // 安全关闭ZIP输出流
            if (zipOut != null) {
                try {
                    zipOut.finish();
                    zipOut.flush();
                    zipOut.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
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
        ZipOutputStream zipOut = null;
        try {
            // 解析任务ID列表
            String[] ids = taskIds.split(",");
            
            // 设置响应头，处理中文
            response.setContentType("application/zip");
            response.setCharacterEncoding("UTF-8");
            response.setHeader("Content-Disposition", "attachment; filename=\"batch_tasks.zip\"; filename*=UTF-8''batch_tasks.zip");
            
            // 创建ZIP输出流，使用缓冲提高性能
            zipOut = new ZipOutputStream(new BufferedOutputStream(response.getOutputStream()));
            zipOut.setLevel(9); // 最高压缩级别
            
            // 处理每个任务
            for (String idStr : ids) {
                try {
                    Long taskId = Long.parseLong(idStr.trim());
                    TaskVo task = taskService.getById(taskId);
                    
                    if (task != null && task.getTaskResult() != null && !task.getTaskResult().trim().isEmpty()) {
                        // 为每个任务创建一个文件夹
                        String folderName = (task.getId() + "_" + (task.getTaskTitle() != null ? task.getTaskTitle().replaceAll("[\\\\/:*?\"<>|]", "_") : ""));
                        
                        // 处理任务结果URL列表
                        String[] urls = task.getTaskResult().split(",|;");
                        for (int i = 0; i < urls.length; i++) {
                            String url = urls[i].trim();
                            if (!url.isEmpty()) {
                                try {
                                    // 从URL下载文件并添加到ZIP中对应任务的文件夹
                                    downloadFileToZip(zipOut, url, folderName + "/" + "file_" + (i + 1) + getFileExtension(url));
                                } catch (IOException e) {
                                    // 记录错误但继续处理其他文件
                                    System.err.println("下载文件失败: " + url + ", 错误: " + e.getMessage());
                                }
                            }
                        }
                    }
                } catch (NumberFormatException e) {
                    // 忽略无效的任务ID
                    continue;
                }
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            try {
                response.reset();
                response.setContentType("text/html;charset=utf-8");
                response.getWriter().write("批量下载失败：" + e.getMessage());
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        } finally {
            // 安全关闭ZIP输出流
            if (zipOut != null) {
                try {
                    zipOut.finish();
                    zipOut.flush();
                    zipOut.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
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
        conn.setConnectTimeout(10000); // 设置连接超时为10秒
        conn.setReadTimeout(30000);    // 设置读取超时为30秒
        
        // 设置请求头，模拟浏览器请求
        conn.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36");
        conn.setRequestProperty("Accept", "*/*");
        
        InputStream in = null;
        try {
            // 添加一个新的ZIP条目，使用UTF-8编码支持中文
            zipOut.putNextEntry(new ZipEntry(entryName));
            
            // 从URL读取并写入ZIP
            in = conn.getInputStream();
            byte[] buffer = new byte[8192]; // 增大缓冲区
            int bytesRead;
            while ((bytesRead = in.read(buffer)) != -1) {
                zipOut.write(buffer, 0, bytesRead);
            }
            
            // 刷新并完成当前条目
            zipOut.flush();
            zipOut.closeEntry();
        } finally {
            // 安全关闭输入流
            if (in != null) {
                try {
                    in.close();
                } catch (IOException e) {
                    System.err.println("关闭输入流失败: " + e.getMessage());
                }
            }
        }
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
