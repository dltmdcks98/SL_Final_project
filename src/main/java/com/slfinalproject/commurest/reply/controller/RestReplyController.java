package com.slfinalproject.commurest.reply.controller;

import com.slfinalproject.commurest.reply.service.ReplyService;
import com.slfinalproject.commurest.util.paging.Page;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequiredArgsConstructor
@Log4j2
@RequestMapping("/ajax/replies")
public class RestReplyController {

    private final ReplyService replyService;

    @GetMapping("")
    public Map<String,Object> list(int boardNo, Page page){
        log.info("/ajax/replies GET! bno={}, page={}", boardNo, page);
        Map<String,Object> replies = replyService.getAll(boardNo,page);
        log.info(replies);
        return replies;
    }
}
