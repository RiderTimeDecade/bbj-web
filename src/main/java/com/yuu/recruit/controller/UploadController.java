package com.yuu.recruit.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSClientBuilder;
import com.aliyun.oss.model.PutObjectRequest;

/**
 * 文件上传控制器
 *
 * @author by yuu
 * @Classname UploadController
 * @Date 2019/10/14 1:37
 * @see com.yuu.recruit.controller
 */
@Controller
public class UploadController {

    private static final String ENDPOINT = "oss-cn-shenzhen.aliyuncs.com";
    private static final String ACCESS_KEY_ID = "LTAI4FkTtw6KQXMzAqJGkqZp";
    private static final String ACCESS_KEY_SECRET = "woaIN9cCyTdxx4k1KTRFM6ySNzftm7";
    private static final String BUCKET_NAME = "recruit1";

    /**
     * 图片上传
     *
     * @param dropzFile
     * @param request
     * @return
     */
    @PostMapping("upload")
    @ResponseBody
	public Map<String, Object> upload(MultipartFile[] dropzFiles, HttpServletRequest request,
			HttpServletResponse response) {

		Map<String, Object> result = new HashMap<>();
		for (MultipartFile dropzFile : dropzFiles) {
			String fileName = dropzFile.getOriginalFilename();
			String suffix = fileName.substring(fileName.lastIndexOf(".") + 1);
			System.out.println();
			String newName = UUID.randomUUID() + "." + suffix;
			OSS client = new OSSClientBuilder().build(ENDPOINT, ACCESS_KEY_ID, ACCESS_KEY_SECRET);
			try {
				client.putObject(
						new PutObjectRequest(BUCKET_NAME, newName, new ByteArrayInputStream(dropzFile.getBytes())));
				// 上传文件路径 = http://BUCKET_NAME.ENDPOINT/自定义路径/fileName
				String filePath = "http://" + BUCKET_NAME + "." + ENDPOINT + "/" + newName;
				result.put("filePath", filePath);
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				client.shutdown();
			}
		}
		return result;
	}

    /**
     * 任务结果上传
     *
     * @param dropzFile
     * @param request
     * @return
     */
    @PostMapping("uploadTaskResult")
    @ResponseBody
	public Map<String, Object> uploadTaskResult(MultipartFile[] dropzFiles,HttpServletRequest request,
			HttpServletResponse response) {
    	System.out.println("UploadController: uploadTaskResult");
    	System.out.println("---files length is :"+dropzFiles.length);
		Map<String, Object> result = new HashMap<>();
		String filePath="";
		int i=1;
		for (MultipartFile dropzFile : dropzFiles) {
			String fileName = dropzFile.getOriginalFilename();
			String suffix = fileName.substring(fileName.lastIndexOf(".") + 1);
			System.out.println("fileName:"+fileName);
			String newName = UUID.randomUUID() + "." + suffix;
			OSS client = new OSSClientBuilder().build(ENDPOINT, ACCESS_KEY_ID, ACCESS_KEY_SECRET);
			try {
				client.putObject(
						new PutObjectRequest(BUCKET_NAME, newName, new ByteArrayInputStream(dropzFile.getBytes())));
				// 上传文件路径 = http://BUCKET_NAME.ENDPOINT/自定义路径/fileName
				if(dropzFiles.length>1 && i>1)
					filePath += ";http://" + BUCKET_NAME + "." + ENDPOINT + "/" + newName;
				else filePath = "http://" + BUCKET_NAME + "." + ENDPOINT + "/" + newName;
				System.out.println("filePath:"+filePath);
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				client.shutdown();
			}
			i++;
		}
		result.put("filePath", filePath);
		return result;
	}

    /**
     * 文件上传
     *
     * @param uploadFile
     * @param request
     * @return
     */
    @PostMapping("uploadFile")
    @ResponseBody
    public Map<String, Object> uploadFile(MultipartFile upload, HttpServletRequest request, HttpServletResponse response) {

        Map<String, Object> result = new HashMap<>();
        String fileName = upload.getOriginalFilename();
        String suffix = fileName.substring(fileName.lastIndexOf(".") + 1);
        String newName = UUID.randomUUID() + "." + suffix;
        OSS client = new OSSClientBuilder().build(ENDPOINT, ACCESS_KEY_ID, ACCESS_KEY_SECRET);
        try {
            client.putObject(new PutObjectRequest(BUCKET_NAME, newName, new ByteArrayInputStream(upload.getBytes())));
            // 上传文件路径 = http://BUCKET_NAME.ENDPOINT/自定义路径/fileName
            String filePath = "http://" + BUCKET_NAME + "." + ENDPOINT + "/" + newName;
            result.put("filePath", filePath);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            client.shutdown();
        }
        return result;
    }

    /**
     * 投标图片上传
     *
     * @param file 上传的文件
     * @param imgNum 图片编号(1或2)
     * @return 包含文件路径的结果
     */
    @PostMapping("uploadBidImage")
    @ResponseBody
    public Map<String, Object> uploadBidImage(MultipartFile file, String imgNum, HttpServletRequest request) {
        Map<String, Object> result = new HashMap<>();
        
        if (file == null || file.isEmpty()) {
            result.put("success", false);
            result.put("message", "上传失败，请选择文件");
            return result;
        }
        
        String fileName = file.getOriginalFilename();
        String suffix = fileName.substring(fileName.lastIndexOf(".") + 1);
        // 使用图片编号作为文件名前缀，避免覆盖
        String newName = "bid_" + imgNum + "_" + UUID.randomUUID() + "." + suffix;
        
        OSS client = new OSSClientBuilder().build(ENDPOINT, ACCESS_KEY_ID, ACCESS_KEY_SECRET);
        try {
            client.putObject(
                    new PutObjectRequest(BUCKET_NAME, newName, new ByteArrayInputStream(file.getBytes())));
            // 上传文件路径 = http://BUCKET_NAME.ENDPOINT/自定义路径/fileName
            String filePath = "http://" + BUCKET_NAME + "." + ENDPOINT + "/" + newName;
            result.put("success", true);
            result.put("filePath", filePath);
        } catch (IOException e) {
            e.printStackTrace();
            result.put("success", false);
            result.put("message", "上传失败: " + e.getMessage());
        } finally {
            client.shutdown();
        }
        
        return result;
    }

}
