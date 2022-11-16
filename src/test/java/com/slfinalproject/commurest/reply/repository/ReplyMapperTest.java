package com.slfinalproject.commurest.reply.repository;

import com.slfinalproject.commurest.reply.domain.Reply;
import com.slfinalproject.commurest.util.paging.Page;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertNotNull;

@SpringBootTest
class ReplyMapperTest {
    @Autowired
    private ReplyMapper mapper;

    @Test
    @DisplayName("특정 게시물의 댓글목록을 조회해야 한다.")
    void findAllTest() {
        List<Reply> replyList = mapper.findAll(19, new Page());

        System.out.println(replyList);

        assertNotNull(replyList);

    }
}