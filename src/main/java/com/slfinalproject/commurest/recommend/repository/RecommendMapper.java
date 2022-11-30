package com.slfinalproject.commurest.recommend.repository;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RecommendMapper {

    boolean setRecommend(int boardNo, int userId);
    boolean deleteRecommendByUserId(int boardNo, int userId);

    int countRecommendBYBoardNo(int boardNo);


}
