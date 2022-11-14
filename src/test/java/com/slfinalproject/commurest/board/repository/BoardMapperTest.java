package com.slfinalproject.commurest.board.repository;

import com.slfinalproject.commurest.board.domain.Board;
import org.apache.catalina.User;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class BoardMapperTest {
    @Autowired
    BoardMapper mapper;

    @Test
    @DisplayName("게시물 250건이 삽입되어야한다")
    void insertBoard() {

        Board board;

        for(int i=1; i<250; i++) {
            board = new Board();
            board.setTitle("test"+i);
            board.setUserId(i);
            board.setContent("내용"+i);
            mapper.insert(board);

        }
    }

}