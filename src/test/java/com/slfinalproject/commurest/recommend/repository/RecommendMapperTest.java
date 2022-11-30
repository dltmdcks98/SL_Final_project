package com.slfinalproject.commurest.recommend.repository;

import com.slfinalproject.commurest.recommend.domain.Recommend;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class RecommendMapperTest {

    @Autowired
    RecommendMapper recommendMapper;

    @Test
    @DisplayName("게시글 번호와 이름이 일치? 어케해야됨ㅋㅋ")
    void Recommend() {
        Recommend recommend;

            recommend = new Recommend();
            recommend.setRecommendNo(5);
            recommend.setUserId(5);
            recommend.setBoardNo(3);
            recommendMapper.updateRecommend(recommend.getRecommendNo());


    }


}