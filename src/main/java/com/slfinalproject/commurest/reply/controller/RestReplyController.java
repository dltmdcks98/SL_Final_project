package com.slfinalproject.commurest.reply.controller;

import com.slfinalproject.commurest.reply.service.ReplyService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@Log4j2
@RequestMapping("/ajax/replies")
public class RestReplyController {

    private ReplyService replyService;

//    @GetMapping("")
//    public Map<String,Object> list(Long boardNo, Page page){
//        log.in
//    }
}
