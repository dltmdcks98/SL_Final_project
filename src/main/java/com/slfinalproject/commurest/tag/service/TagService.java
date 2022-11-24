package com.slfinalproject.commurest.tag.service;

import com.slfinalproject.commurest.tag.domain.Tag;
import com.slfinalproject.commurest.tag.dto.TagList;
import com.slfinalproject.commurest.tag.repository.TagMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Log4j2
public class TagService {

    private final TagMapper tagMapper;


    public String getTagValue(int tagId){
        return tagMapper.getTagValue(tagId);
    }

    public List<Tag> getTagValueByUserId(int userId){
        return tagMapper.getTagValueByUserId(userId);
    }

    public boolean setTagValue(String value){
        return tagMapper.setTagValue(value);
    }


    public boolean setTagValueByBoardNo(String value,int boardNo){
        return tagMapper.setTagValueByBoardNo(value,boardNo);
    }

    public boolean setTagValueByUserId(String value ,int userId){
        return tagMapper.setTagValueByUserId(value,userId);
    }
    public boolean deleteTag(int userId, String tagValue){
        return tagMapper.deleteTag(userId,tagValue);
    };
    public List<TagList> getHotTag(){
        return tagMapper.getHotTag();
    }
    public List<TagList> getHotTagByUser(){return tagMapper.getHotTagByUser();}
}
