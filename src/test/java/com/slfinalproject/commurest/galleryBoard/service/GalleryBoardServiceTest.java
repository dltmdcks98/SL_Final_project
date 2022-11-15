package com.slfinalproject.commurest.galleryBoard.service;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.ArrayList;
import java.util.List;

@SpringBootTest
class GalleryBoardServiceTest {

    @Autowired
    private GalleryBoardService service;

    @Test
    @DisplayName("검색결과 출력 조회")
    void getimglist(){
        List<String> result = new ArrayList<>();
        String str = "";

        for(int i=0; i<3; i++){ //검색 시작 페이지
            for(int j=0; j<10; j++){ //검색 결과 list 분해
                str = service.getImgUrl("아이유",i,10).get(j);
                result.add(str);
            }
        }


        for(String url:result) System.out.println(url);

        Assertions.assertNotNull(result);

    }
    @Test
    @DisplayName("tag bulk 값 입력, tag 삽입")
    void setTagValue(){
        boolean test = service.setTagValue("박보영");
        Assertions.assertTrue(test);
    }
    @Test
    @DisplayName("tag value값 출력")
    void getTagValue(){
        String test = service.getTagValue(1);

        Assertions.assertEquals("아이유",test);
    }
}