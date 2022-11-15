package com.slfinalproject.commurest.galleryBoard.repository;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface GalleryMapper {

    String getTagValue(int tagId);

    boolean setTagValue(String tagValue);
}
