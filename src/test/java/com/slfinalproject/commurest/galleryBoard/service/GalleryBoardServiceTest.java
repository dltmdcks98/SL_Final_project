package com.slfinalproject.commurest.galleryBoard.service;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
class GalleryBoardServiceTest {

    @Autowired
    private GalleryBoardService service;

    @Test
    @DisplayName("검색결과 출력 조회")
    void getimglist(){
        List<String> result = service.getImgUrl("아이유");
        for(String url:result) System.out.println(url);
        Assertions.assertNotNull(result);


    }

}