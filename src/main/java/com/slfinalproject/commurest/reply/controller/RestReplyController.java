package com.slfinalproject.commurest.reply.controller;

import com.slfinalproject.commurest.admin.domain.Admin;
import com.slfinalproject.commurest.reply.domain.Reply;
import com.slfinalproject.commurest.reply.service.ReplyService;
import com.slfinalproject.commurest.util.paging.Page;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Map;

@RestController
@RequiredArgsConstructor
@Log4j2
@RequestMapping("/ajax/replies")
@CrossOrigin
public class RestReplyController {

    private final ReplyService replyService;

    @GetMapping("")
    public Map<String,Object> list(int boardNo, Page page){
        log.info("/ajax/replies GET bno={}, page={}", boardNo, page);
        Map<String,Object> replies = replyService.getAll(boardNo,page);
        log.info(replies);
        return replies;
    }

    @PostMapping("")
    @ResponseBody
    public String saveReply(@RequestBody Reply reply, HttpSession session){

        Admin user = (Admin) session.getAttribute("user");
        reply.setUserAccount(user.getUser_id());
        log.info("saveRelpy Controller - POST {}",reply);
        boolean status = replyService.write(reply);
        return status ? "insert-success" : "insert-fail";
    }
    @DeleteMapping("{rno}")
    public String deleteRelply(@PathVariable int rno){
        log.info("Delete Reply - rno:{}"+rno);
        boolean result = replyService.remove(rno);
        return result ? "del-success" : "del-fail";
    }

    @PutMapping("{rno}")
    public String modify(@PathVariable int rno, @RequestBody Reply reply){
        log.info("Modify Reply GET - {}, {}"+ rno,reply);
        reply.setReplyNo(rno);
        boolean result = replyService.modify(reply);
        return result ? "mod-success" : "mod-fail";
    }
}
