package com.slfinalproject.commurest.tag.repository;

import com.slfinalproject.commurest.board.domain.Board;
import com.slfinalproject.commurest.board.repository.BoardMapper;
import com.slfinalproject.commurest.tag.domain.Tag;
import com.slfinalproject.commurest.tag.dto.TagList;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.util.Assert;

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
    @DisplayName("사용자 태그 랜덤 선택")
    void getRandomTagValueByUserId(){
        String tagValue = tagMapper.getRandomTagValueByUserId(51);
        System.out.println(tagValue);
        assertNotNull(tagValue);
    }
    @Test
    @DisplayName("게시글의 태그 리스트 출력")
     void selectTagByBoardNo(){
        List<Tag> tagList = tagMapper.getTagValueByBoardNo(131);
        System.out.println(tagList);
        assertNotNull(tagList);
    }

    @Test
    @DisplayName("태그 삭제 테스트")
    void deleteTag(){
        Assert.isTrue(tagMapper.deleteTag(18,"이나경"));
    }

    @Test
    @DisplayName("userId 기반 태그 저장")
    void setTagValueByUserId(){
        Assert.isTrue(tagMapper.setTagValueByUserId("이나경",18));
    }


    @Test
    @DisplayName("get TagId")
    void getTagId(){
        int bno =tagMapper.getTagId("아이유",1);
        System.out.println(bno);

    }
}