package com.slfinalproject.commurest.tag.repository;

import com.slfinalproject.commurest.tag.domain.Tag;
import com.slfinalproject.commurest.tag.dto.TagList;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TagMapper {

    String getTagValue(int tagId);
    int getBoardNo();
    int getTagId(String tagValue, int boardNo);
    List<Tag> getTagValueByUserId(int userId);
    String getRandomTagValueByUserId(int userId);
    List<Tag> getTagValueByBoardNo(int boardNo);
    boolean setTagValue(String tagValue);
    boolean setTagValueByBoardNo(String tagValue,int boardNo);
    boolean setTagValueByUserId(String tagValue,int userId);
    List<Tag> getTagByKeyword(String keyword);
    boolean updateTag(String tagValue, int tagId);
    List<TagList> getHotTag();
    List<TagList> getHotTagByUser();
    boolean deleteTag(int userId, String tagValue);
    boolean deleteTagByBoardNo(int BoardNo);

}
