package com.slfinalproject.commurest.tag.repository;

import com.slfinalproject.commurest.tag.domain.Tag;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TagMapper {

    String getTagValue(int tagId);
    int getBoardNo();
    List<Tag> getTagValueByUserId(int userId);
    boolean setTagValue(String tagValue);
    boolean setTagValueByBoardNo(String tagValue,int boardNo);
    boolean setTagValueByUserId(String tagValue,int userId);

}
