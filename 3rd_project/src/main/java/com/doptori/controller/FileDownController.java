package com.doptori.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
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
        String realBd_pic = request.getSession().getServletContext().getRealPath("/resources/images/" + bd_pic);

        File file1 = new File(realBd_pic);
        if (!file1.exists()) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        // 파일 다운로드를 위한 설정
        response.setContentType("application/octet-stream");
        response.setHeader("Content-Transfer-Encoding", "binary");

        // 파일 이름 추출
        String fileName = file1.getName();

        // Content-Disposition 헤더에 원래 파일 이름과 확장자 지정
        String contentDisposition = String.format("attachment; filename=\"%s\"", URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "%20"));
        response.setHeader("Content-Disposition", contentDisposition);

        try {
            OutputStream os = response.getOutputStream();
            FileInputStream fis = new FileInputStream(realBd_pic);

            int ncount = 0;
            byte[] bytes = new byte[512];

            while ((ncount = fis.read(bytes)) != -1) {
                os.write(bytes, 0, ncount);
            }
            fis.close();
            os.flush();
            os.close();
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            e.printStackTrace();
        }
    }
}
