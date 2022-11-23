package com.slfinalproject.commurest.board.repository;

import com.slfinalproject.commurest.board.domain.Board;
import com.slfinalproject.commurest.reply.dto.ReplyDTO;
import com.slfinalproject.commurest.reply.repository.ReplyMapper;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
class BoardMapperTest {
    @Autowired
    BoardMapper mapper;

    @Autowired
    ReplyMapper replyMapper;

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

    @Test
    @DisplayName("게시물 조회")
    void selectOne(){
        List<ReplyDTO> list = replyMapper.getBoardNoByReplyCount();
        for(ReplyDTO replyDTO : list){
            System.out.println(replyDTO.getBoardNo());
            System.out.println(mapper.selectOne(replyDTO.getBoardNo()));
        }
    }


}