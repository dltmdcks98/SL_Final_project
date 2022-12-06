package com.slfinalproject.commurest.util.file;


import org.springframework.http.MediaType;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

public class FileUtil {


    // MIME TYPE 설정을 위한 맵 만들기
    private static final Map<String, MediaType> mediaMap;

    static {
        mediaMap = new HashMap<>();
        mediaMap.put("JPG", MediaType.IMAGE_JPEG);
        mediaMap.put("GIF", MediaType.IMAGE_GIF);
        mediaMap.put("PNG", MediaType.IMAGE_PNG);
    }

    // 확장자를 알려주면 미디어타입을 리턴하는 메서드
    public static MediaType getMediaType(String ext) {
        String upperExt = ext.toUpperCase();
        if (mediaMap.containsKey(upperExt)) {
            return mediaMap.get(upperExt);
        }
        return null;
    }

    /**
     *
     * @param file - 클라이언트가 업로드한 파일 정보
     * @param uploadPath - 서버의 업로드 루트 디렉토리
     * @return - 업로드가 완료된 새로운 파일의 full path
     */
    public static String uploadFile(MultipartFile file, String uploadPath) {

        // 중복이 없는 파일명으로 변경
        // randomUUID를 통해 중복이 없는 이름으로 바꿔준다
        String newFileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename(); // 중복이 없는 랜덤아이디 값 생성 +

        // 업로드 경로를 변경
        String newUploadPath = getNewUploadPath(uploadPath);

        // 파일 업로드 수행
        File f = new File(newUploadPath, newFileName);

        try {
            file.transferTo(f);
        } catch (IOException e) {
            e.printStackTrace();
        }

        // 파일의 풀 경로 (디렉토리경로 + 파일명)
        String fileFullPath = newUploadPath + File.separator + newFileName;

        // 풀 경로 - 루트 경로 문자열 생성
        String responseFilePath = fileFullPath.substring(uploadPath.length());

        return responseFilePath.replace("\\", "/");
    }

    /**
     * 원본 업로드 경로를 받아서 일자별 폴더를 생성 한 후 최종경로를 리턴
     * @param uploadPath - 원본 업로드 경로
     * @return 일자별 폴더가 포함된 새로운 업로드 경로
     */
    private static String getNewUploadPath(String uploadPath) {

        // 오늘 년,월,일 정보 가져오기
        LocalDateTime now = LocalDateTime.now(); // date - 1.1에서 멈춤, calendar에서 LocalDateTime으로 넘어옴 다만 Mybatis에서 설정좀 해줘야됨
        int y = now.getYear();
        int m = now.getMonthValue();
        int d = now.getDayOfMonth();

        // 폴더 생성 -- api처리
        String[] dateInfo = {
                String.valueOf(y)
                , len2(m)
                , len2(d)
        };

        String newUploadPath = uploadPath;



        for (String date : dateInfo) {
            newUploadPath += File.separator + date;

            // 해당 경로대로 폴더를 생성
            File dirName = new File(newUploadPath);
            if (!dirName.exists()) dirName.mkdir(); // 파일의 날짜 경로가 존재하지않으면 새로운 업로드 폴더를 만듬
        }

        return newUploadPath;
    }

    // 한자리수 월, 일 정보를 항상 2자리로 만들어주는 메서드
    private static String len2(int n) {
        return new DecimalFormat("00").format(n);
    }

    // 파일명을 받아서 확장자를 반환하는 메서드
    public static String getFileExtension(String fileName) {
        return fileName.substring(fileName.lastIndexOf(".") + 1);
    }
}
