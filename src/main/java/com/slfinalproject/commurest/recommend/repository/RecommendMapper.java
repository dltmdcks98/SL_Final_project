package com.slfinalproject.commurest.recommend.repository;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RecommendMapper {

    // 게시글 추천수
    void updateRecommend(int bno);
    // 게시글 추천취소
    void updateRecommendCancel(int bno);
    // 게시글 추천시 추천수 테이블에 추가
    void insertRecommend(int bno, int userId);
    // 게시글 추천취소 시 감소
    void deleteRecommend(int bno, int userId);
    // 게시글 추천 시 Check = 1로 만듬
    void updateRecommendCheck(int bno, int userId);
    // 게시글 추천취소 시 되돌리기 Check = 0
    void updateRecommendCheckCancel(int bno, int userId);
    // 게시글 추천 중복방지
    int recommendCheck(int bno, int userId);
}
