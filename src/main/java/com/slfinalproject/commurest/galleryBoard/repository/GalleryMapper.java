package com.slfinalproject.commurest.galleryBoard.repository;

import com.slfinalproject.commurest.galleryBoard.domain.Tag;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface GalleryMapper {

    String getTagValue(int tagId);

    List<Tag> getTagValueByUserId(int userId);
    boolean setTagValue(String tagValue);
    boolean setTagValueByBoardNo(String tagValue,int boardNo);
    boolean setTagValueByUserId(String tagValue,int userId);

}
