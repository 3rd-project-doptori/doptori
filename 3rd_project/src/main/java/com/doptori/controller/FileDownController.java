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
    public void fileDownload(HttpServletRequest request,HttpServletResponse response) throws Exception {
        //String path =  request.getSession().getServletContext().getRealPath("저장경로");
        
        String bd_pic = request.getParameter("bd_pic");
        String realBd_pic = "C:\\Users\\user\\git\\doptori\\3rd_project\\src\\main\\webapp\\resources\\images";
        System.out.println(bd_pic);
         
        try {
            String browser = request.getHeader("User-Agent"); 
            //파일 인코딩 
            if (browser.contains("MSIE") || browser.contains("Trident")
                    || browser.contains("Chrome")) {
            	bd_pic = URLEncoder.encode(bd_pic, "UTF-8").replaceAll("\\+",
                        "%20");
            } else {
            	bd_pic = new String(bd_pic.getBytes("UTF-8"), "ISO-8859-1");
            }
        } catch (UnsupportedEncodingException ex) {
            System.out.println("UnsupportedEncodingException");
        }
        realBd_pic = "C:\\Users\\user\\git\\doptori\\3rd_project\\src\\main\\webapp\\resources\\images";// + bd_pic;
        System.out.println(realBd_pic);
        File file1 = new File(realBd_pic);
        if (!file1.exists()) {
            return ;
        }
         
        // 파일명 지정        
        response.setContentType("application/octer-stream");
        response.setHeader("Content-Transfer-Encoding", "binary;");
        response.setHeader("Content-Disposition", "attachment; bd_pic=\"" + bd_pic + "\"");
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
