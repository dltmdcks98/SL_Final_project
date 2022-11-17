package com.slfinalproject.commurest.reply.service;

import com.slfinalproject.commurest.reply.domain.Reply;
import com.slfinalproject.commurest.reply.repository.ReplyMapper;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;
@SpringBootTest
class ReplyServiceTest {

    @Autowired
    private ReplyService service;
    @Autowired
    private ReplyMapper mapper;
    @Test
    @DisplayName("댓글 등록")
    void saveReply(){

        Reply reply = new Reply();
        reply.setReplyText("댓글");
        reply.setReplyWriter("메롱이");
        reply.setBoardNo(19);
        reply.setUserAccount(11);
        boolean temp = service.write(reply);
        assertTrue(temp);

    }

    @Test
    @DisplayName("댓글 수 조회")
    void findAll(){
        int temp = service.getCount(19);
        System.out.println(temp);
        assertNotNull(temp);
    }
}