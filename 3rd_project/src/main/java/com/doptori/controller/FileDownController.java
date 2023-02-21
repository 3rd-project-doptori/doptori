package com.doptori.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FileDownController {
	
	 @RequestMapping("/fileDownload.do")
	    public void fileDownload(HttpServletRequest request, HttpServletResponse response) throws Exception {
	        String bd_pic = request.getParameter("bd_pic");
	        String realBd_pic = "C:\\Users\\user\\git\\doptori\\3rd_project\\src\\main\\webapp\\resources\\images\\" + bd_pic;

	        File file1 = new File(realBd_pic);
	        if (!file1.exists()) {
	            return;
	        }

	        // 파일 다운로드를 위한 설정
	        response.setContentType("application/octet-stream");
	        response.setHeader("Content-Transfer-Encoding", "binary");

	        // 파일 이름 추출
	        String fileName = file1.getName();
	        String originalFileName = fileName.substring(0, fileName.lastIndexOf('.'));
	        String extension = fileName.substring(fileName.lastIndexOf('.') + 1);

	        // 파일 이름 UTF-8로 인코딩
	        String encodedFileName = URLEncoder.encode(originalFileName, "UTF-8").replaceAll("\\+", "%20");
	        String encodedExtension = URLEncoder.encode(extension, "UTF-8").replaceAll("\\+", "%20");

        // Content-Disposition 헤더에 원래 파일 이름과 확장자 지정
        response.setHeader("Content-Disposition", "attachment; filename=\"" + encodedFileName + "." + encodedExtension + "\"");
        
        try {
            OutputStream os = response.getOutputStream();
            FileInputStream fis = new FileInputStream(realBd_pic);
 
            int ncount = 0;
            byte[] bytes = new byte[512];
 
            while ((ncount = fis.read(bytes)) != -1 ) {
                os.write(bytes, 0, ncount);
            }
            fis.close();
            os.close();
        } catch (Exception e) {
            System.out.println("FileNotFoundException : " + e);
        }
    }
	
}
