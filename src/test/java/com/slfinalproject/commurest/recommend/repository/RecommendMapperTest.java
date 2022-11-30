package com.slfinalproject.commurest.recommend.repository;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

@SpringBootTest
class RecommendMapperTest {

    @Autowired
    private RecommendMapper recommendMapper;

    @Test
    @DisplayName("좋아요 등록")
    void setRecommend(){
        boolean status = recommendMapper.setRecommend(125,51);
        assertTrue(status);
    }

    @Test
    @DisplayName("총 좋아요 갯수")
    void getCount(){
        int count = recommendMapper.countRecommendBYBoardNo(125);
        System.out.println(count);
        assertNotNull(count);
    }

    @Test
    @DisplayName("좋아요 삭제")
    void deleteRecommned(){
        boolean status = recommendMapper.deleteRecommendByUserId(125,51);
        assertTrue(status);
    }

}