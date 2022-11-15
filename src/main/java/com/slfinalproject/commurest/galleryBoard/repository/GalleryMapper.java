package com.slfinalproject.commurest.galleryBoard.repository;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface GalleryMapper {

    String getTagValue(int tagId);

    String getTagValueByUserId(int userId);
    boolean setTagValue(String tagValue);
    boolean setTagValueByBoardNo(String tagValue,int boardNo);
    boolean setTagValueByUserId(String tagValue,int userId);

}
