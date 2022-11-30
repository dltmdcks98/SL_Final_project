package com.slfinalproject.commurest.recommend.service;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class RecommendServiceTest {

    @Autowired
    private RecommendService recommendService;

    @Test
    @DisplayName("추천 확인")
    void confirm(){
        System.out.println(recommendService.confirmRecommend(498,51));
    }
}