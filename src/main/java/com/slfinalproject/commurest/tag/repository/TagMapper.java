package com.slfinalproject.commurest.tag.repository;

import com.slfinalproject.commurest.tag.domain.Tag;
import com.slfinalproject.commurest.tag.dto.TagList;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TagMapper {

    String getTagValue(int tagId);
    int getBoardNo();
    List<Tag> getTagValueByUserId(int userId);
    List<Tag> getTagValueByBoardNo(int boardNo);
    boolean setTagValue(String tagValue);
    boolean setTagValueByBoardNo(String tagValue,int boardNo);
    boolean setTagValueByUserId(String tagValue,int userId);

    List<TagList> getHotTag();

    boolean deleteTag(int userId, String tagValue);

}
