package com.slfinalproject.commurest.tag.repository;

import com.slfinalproject.commurest.board.domain.Board;
import com.slfinalproject.commurest.board.repository.BoardMapper;
import com.slfinalproject.commurest.tag.domain.Tag;
import com.slfinalproject.commurest.tag.dto.TagList;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertNotNull;

@SpringBootTest
class TagMapperTest {

    @Autowired
    private BoardMapper boardMapper;
    @Autowired
    private TagMapper tagMapper;

    @Test
    @DisplayName("태그 여러개 입력")
    void insert(){
        Board board = new Board();
        board.setTitle("test");
        board.setContent("test");
        board.setUserId(11);
        boardMapper.insert(board);
        int num = tagMapper.getBoardNo();
        for(int i=0; i<10;i++){
            tagMapper.setTagValueByBoardNo("test"+i,num);
        }
    }

    @Test
    @DisplayName("인기 태그 확인")
    void selectHotTag(){
        List<TagList> taglist = tagMapper.getHotTag();
        System.out.println(taglist);
        assertNotNull(taglist);
    }

    @Test
    @DisplayName("게시글의 태그 리스트 출력")
     void selectTagByBoardNo(){
        List<Tag> tagList = tagMapper.getTagValueByBoardNo(131);
        System.out.println(tagList);
        assertNotNull(tagList);
    }
}