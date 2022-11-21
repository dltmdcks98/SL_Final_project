package com.slfinalproject.commurest.tag.repository;

import com.slfinalproject.commurest.board.domain.Board;
import com.slfinalproject.commurest.board.repository.BoardMapper;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
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
}