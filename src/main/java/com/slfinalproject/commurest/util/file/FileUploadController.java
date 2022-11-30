package com.slfinalproject.commurest.util.file;

import lombok.extern.log4j.Log4j2;
import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;


import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.List;

@Log4j2
@Controller
public class FileUploadController {

    // 업로드 파일 저장 경로
    private static final String UPLOAD_PATH = "D:\\sl_stw\\upload";

    // upload-form.jsp로 포워딩하는 요청
    @GetMapping("/upload-form")
    public String uploadForm() {
        return "upload/upload-form";
    }

    // 파일 업로드 처리를 위한 요청
    @PostMapping("/upload")
    public String upload(@RequestParam("file") List<MultipartFile> fileList) {
        log.info("/upload POST! - {}", fileList);

        for (MultipartFile file: fileList) {
            log.info("file-name: {}", file.getName());
            log.info("file-origin-name: {}", file.getOriginalFilename());
            log.info("file-size: {}KB", (double) file.getSize() / 1024);
            log.info("file-type: {}", file.getContentType());
            System.out.println("==================================================================");


            // 서버에 업로드파일 저장



            // 1. 세이브파일 객체 생성
            //  - 첫번째 파라미터는 파일 저장경로 지정, 두번째 파일명지정
        /*File f = new File(uploadPath, file.getOriginalFilename());

        try {
            file.transferTo(f);
        } catch (IOException e) {
            e.printStackTrace();
        }*/

            FileUtil.uploadFile(file, UPLOAD_PATH);
        }

        return "redirect:/upload-form";
    }

    // 비동기 요청 파일 업로드 처리
    @PostMapping("/ajax-upload")
    @ResponseBody
    public ResponseEntity<List<String>> ajaxUpload(List<MultipartFile> files) {

        log.info("/ajax-upload POST! - {}", files.get(0).getOriginalFilename());

        // 클라이언트에게 전송할 파일경로 리스트
        List<String> fileNames = new ArrayList<>();

        // 클라이언트가 전송한 파일 업로드하기
        for (MultipartFile file : files) {
            String fullPath = FileUtil.uploadFile(file, UPLOAD_PATH);
            fileNames.add(fullPath);
        }

        return new ResponseEntity<>(fileNames, HttpStatus.OK);
    }

    // 파일 데이터 로드 요청 처리
    @GetMapping("/loadFile")
    @ResponseBody
    public ResponseEntity<byte[]> loadFile(String fileName) {

        log.info("filename load - {}", fileName);

        File f = new File(UPLOAD_PATH + fileName);

        if (!f.exists()) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }


        try (FileInputStream fis = new FileInputStream(f)) {
            // 확장자 추출.
            String ext = FileUtil.getFileExtension(fileName);
            MediaType mediaType = FileUtil.getMediaType(ext);

            // 미디어 타입 설정
            HttpHeaders headers = new HttpHeaders();

            if (mediaType != null) {
                headers.setContentType(mediaType);
            } else { // 이미지가 아니면 다운로드 가능하게 설정
                headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);

                // 파일명을 원래대로 복구
                fileName = fileName.substring(fileName.lastIndexOf("_") + 1);

                // 파일명이 한글인 경우 인코딩 재설정
                String encoding = new String(
                        fileName.getBytes("UTF-8"), "ISO-8859-1");

                // 미디어 타입 작업 내용 추가
                headers.add("Content-Disposition"
                        , "attachment; fileName=\"" + encoding + "\"");

            }

            // 파일을 바이트배열에 저장.
            byte[] rawData = IOUtils.toByteArray(fis);

            // 클라이언트에 파일 데이터 응답
            return new ResponseEntity<>(rawData, headers, HttpStatus.OK);

        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }

    // 서버에 있는 파일 삭제 요청처리
    @DeleteMapping("/deleteFile")
    public ResponseEntity<String> deleteFile(String fileName) throws Exception {

        try {
            //파일 삭제
            File delFile = new File(UPLOAD_PATH + fileName);
            if (!delFile.exists()) return new ResponseEntity<>(HttpStatus.NOT_FOUND);

            delFile.delete();

            return new ResponseEntity<>("file-del-success", HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }

    }


}
