package com.slfinalproject.commurest.recommend.service;


import com.slfinalproject.commurest.recommend.repository.RecommendMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

@Service @RequiredArgsConstructor @Log4j2
public class RecommendService {
    private final RecommendMapper recommendMapper;

    // 게시글 추천수
    public void updateRecommend(int bno) {
        recommendMapper.updateRecommend(bno);
    }

    // 게시글 추천취소 시 감소
    public void updateRecommendCancel(int bno) {
        recommendMapper.updateRecommendCancel(bno);
    }

    // 게시글 추천시 추천수 테이블에 추가
    public void insertRecommend(int bno, int userId) {
        recommendMapper.insertRecommend(bno, userId);
    }

    // 게시글 추천취소 시 감소
    public void deleteRecommend(int bno, int userId) {
        recommendMapper.deleteRecommend(bno, userId);
    }

    // 게시글 추천 시 Check = 1
    public void updateRecommendCheck(int bno, int userId) {
        recommendMapper.updateRecommendCheck(bno, userId);
    }

    // 게시글 추천취소 시 되돌리기 Check = 0
    public void updateRecommendCheckCancel(int bno, int userId) {
        recommendMapper.updateRecommendCheckCancel(bno, userId);
    }

    // 게시글 추천 중복방지
    public int recommendCheck(int bno, int userId) {
        return recommendMapper.recommendCheck(bno, userId);
    }
}
