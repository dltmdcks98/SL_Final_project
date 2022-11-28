package com.slfinalproject.commurest.recommend.repository;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RecommendMapper {

    // 게시글 추천수
    void recommend(int boardNo);

    // 게시글 추천취소
    void recommendCancel(int boardNo);

    void updateRecommend(int boardNo);

    // 게시글 추천 중복방지
    int getRecommend(int boardNo, String userName);

}
