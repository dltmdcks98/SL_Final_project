package com.slfinalproject.commurest.recommend.service;


import com.slfinalproject.commurest.recommend.repository.RecommendMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Log4j2
public class RecommendService {

    private final RecommendMapper recommendMapper;

    public boolean setRecommend(int boardNo, int userId){return recommendMapper.setRecommend(boardNo,userId);}
    public boolean deleteRecommendByUserId(int boardNo, int userId){return recommendMapper.deleteRecommendByUserId(boardNo, userId);}
    public int countRecommendBYBoardNo(int boardNo){return recommendMapper.countRecommendBYBoardNo(boardNo);}

    public boolean confirmRecommend(int boardNo, int userId){
        int result = recommendMapper.confirmRecommend(boardNo,userId);
        return result > 0;
    }


}
