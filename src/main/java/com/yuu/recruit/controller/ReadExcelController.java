package com.yuu.recruit.controller;

import com.yuu.recruit.result.Result;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("employer/task")
public class ReadExcelController {
    
    /**
     * 读取上传的Excel文件
     * 
     * @param file 上传的Excel文件
     * @return Excel解析结果
     */
    @PostMapping("read_excel")
    @ResponseBody
    public Result readExcel(@RequestParam("file") MultipartFile file) {
        // 检查文件是否为空
        if (file.isEmpty()) {
            return Result.failure("请选择要上传的Excel文件");
        }
        
        // 检查文件类型
        String fileName = file.getOriginalFilename();
        if (fileName == null || (!fileName.endsWith(".xls") && !fileName.endsWith(".xlsx"))) {
            return Result.failure("文件格式不正确，只支持.xls和.xlsx格式");
        }
        
        try {
            // 获取工作簿
            Workbook workbook = getWorkbook(file.getInputStream(), fileName);
            if (workbook == null) {
                return Result.failure("无法读取Excel文件");
            }
            
            // 获取第一个工作表
            Sheet sheet = workbook.getSheetAt(0);
            if (sheet == null) {
                workbook.close();
                return Result.failure("Excel文件中没有工作表");
            }
            
            // 解析数据
            List<Map<String, Object>> dataList = parseExcelData(sheet);
            if (dataList.isEmpty()) {
                workbook.close();
                return Result.failure("Excel文件中没有数据");
            }
            
            // 关闭工作簿
            workbook.close();
            
            // 返回成功结果
            return Result.success("成功读取到" + dataList.size() + "条数据", dataList);
            
        } catch (IOException e) {
            return Result.failure("读取Excel文件失败: " + e.getMessage());
        } catch (Exception e) {
            return Result.failure("处理Excel文件时发生错误: " + e.getMessage());
        }
    }
    
    /**
     * 根据文件名创建工作簿
     * 
     * @param inputStream 文件输入流
     * @param fileName 文件名
     * @return 工作簿对象
     */
    private Workbook getWorkbook(InputStream inputStream, String fileName) throws IOException {
        if (fileName.endsWith(".xls")) {
            return new HSSFWorkbook(inputStream);
        } else if (fileName.endsWith(".xlsx")) {
            return new XSSFWorkbook(inputStream);
        }
        return null;
    }
    
    /**
     * 解析Excel工作表数据
     * 
     * @param sheet 工作表
     * @return 解析后的数据列表
     */
    private List<Map<String, Object>> parseExcelData(Sheet sheet) {
        List<Map<String, Object>> dataList = new ArrayList<>();
        
        // 获取表头行
        Row headerRow = sheet.getRow(0);
        if (headerRow == null) {
            return dataList;
        }
        
        // 获取列数
        int cellCount = headerRow.getPhysicalNumberOfCells();
        
        // 保存表头
        String[] headers = new String[cellCount];
        for (int i = 0; i < cellCount; i++) {
            Cell cell = headerRow.getCell(i);
            headers[i] = getCellValue(cell);
        }
        
        // 从第二行开始解析数据行
        int rowCount = sheet.getPhysicalNumberOfRows();
        for (int i = 1; i < rowCount; i++) {
            Row row = sheet.getRow(i);
            if (row == null) {
                continue;
            }
            
            // 检查行是否为空
            boolean isEmpty = true;
            for (int j = 0; j < cellCount; j++) {
                if (row.getCell(j) != null && !getCellValue(row.getCell(j)).trim().isEmpty()) {
                    isEmpty = false;
                    break;
                }
            }
            if (isEmpty) {
                continue;
            }
            
            // 解析行数据
            Map<String, Object> rowData = new HashMap<>();
            for (int j = 0; j < cellCount; j++) {
                Cell cell = row.getCell(j);
                String value = getCellValue(cell);
                rowData.put(headers[j], value);
            }
            
            dataList.add(rowData);
        }
        
        return dataList;
    }
    
    /**
     * 获取单元格的值
     * 
     * @param cell 单元格
     * @return 单元格的值
     */
    private String getCellValue(Cell cell) {
        if (cell == null) {
            return "";
        }
        
        switch (cell.getCellType()) {
            case STRING:
                return cell.getStringCellValue();
            case NUMERIC:
                if (DateUtil.isCellDateFormatted(cell)) {
                    return cell.getDateCellValue().toString();
                } else {
                    // 处理数值，避免科学计数法
                    double value = cell.getNumericCellValue();
                    if (value == (long) value) {
                        return String.valueOf((long) value);
                    } else {
                        return String.valueOf(value);
                    }
                }
            case BOOLEAN:
                return String.valueOf(cell.getBooleanCellValue());
            case FORMULA:
                try {
                    return String.valueOf(cell.getNumericCellValue());
                } catch (Exception e) {
                    try {
                        return cell.getStringCellValue();
                    } catch (Exception ex) {
                        return "";
                    }
                }
            default:
                return "";
        }
    }
}
