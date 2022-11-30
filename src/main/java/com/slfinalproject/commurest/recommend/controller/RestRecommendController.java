package com.slfinalproject.commurest.recommend.controller;

import com.slfinalproject.commurest.admin.domain.Admin;
import com.slfinalproject.commurest.recommend.service.RecommendService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;

@RestController
@RequiredArgsConstructor
@Log4j2
@RequestMapping("/ajax/recommend")
public class RestRecommendController {
    private final RecommendService recommendService;

    @GetMapping("")
    public String recommendHandler(int boardNo, HttpSession session){
        Admin user = (Admin) session.getAttribute("user");
        int userId = user.getUser_id();
        log.info("REST recommend recommendHandler -{}",boardNo);
        if(recommendService.confirmRecommend(boardNo,userId)){
            log.info("좋아요 표시 제거");
            recommendService.deleteRecommendByUserId(boardNo,userId);
            return "delete";
        }else{
            log.info("좋아요 표시");
            recommendService.setRecommend(boardNo,userId);
            return "register";
        }


    }




}
