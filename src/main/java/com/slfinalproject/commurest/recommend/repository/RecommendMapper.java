package com.slfinalproject.commurest.recommend.repository;

import com.slfinalproject.commurest.recommend.domain.Recommend;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RecommendMapper {

    // 게시글 추천수
    void insertRecommend(Recommend recommend);

    // 게시글 추천취소
    void deleteRecommend(Recommend recommend);

    void updateRecommend(int boardNo);

    // 게시글 추천 중복방지
    int getRecommend(Recommend recommend);

}
