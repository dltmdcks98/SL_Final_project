package com.slfinalproject.commurest.board.service;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class BoardServiceTest {
    @Autowired
    BoardService boardService;

    @Test
    @DisplayName("게시글 번호와 이름이 일치? ")
    void Recommend() {

    }
}