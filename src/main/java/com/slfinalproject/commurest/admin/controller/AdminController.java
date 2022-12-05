package com.slfinalproject.commurest.admin.controller;

import com.slfinalproject.commurest.admin.domain.Admin;
import com.slfinalproject.commurest.admin.service.AdminService;
import com.slfinalproject.commurest.board.service.BoardService;
import com.slfinalproject.commurest.galleryBoard.service.GalleryBoardService;
import com.slfinalproject.commurest.reply.service.ReplyService;
import com.slfinalproject.commurest.tag.service.TagService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@Controller
@RequiredArgsConstructor
@Slf4j
public class AdminController {

    private final AdminService adminService;
    private final GalleryBoardService galleryBoardService;
    private final TagService tagService;
    private final BoardService boardService;
    private final ReplyService replyService;
    // 회원가입 처리
    @PostMapping("/admin/regist")
    public String regist(Admin admin) {
        log.info("/admin/regist POST - param: {}", admin);

        return adminService.regist(admin) ? "redirect:/" : "/error";
    }

    // 로그인페이지
    @GetMapping("/login")
    public String login(HttpServletRequest request) {
        String refer = request.getHeader("Referer").substring(21);
        if(refer.equals("/login")){
            return (String) request.getSession().getAttribute("redirectURI");
        }
        request.getSession().setAttribute("redirectURI", refer);
        if(request.getSession().getAttribute("user")==null){
            log.info("GET -로그인 시도 refer : {}",refer);
            return "member/login";
        }
        return refer;
    }
    @GetMapping("/login_success")
    public String loginSuccess(HttpSession session, HttpServletRequest request) {
        String redirectURI = null;
        log.info("login success");
        redirectURI = (String) session.getAttribute("redirectURI");
        if(redirectURI==null){
            String refer = request.getHeader("Referer").substring(21);
            log.info("subString : {}",refer);
            request.getSession().setAttribute("redirectURI", refer);
            redirectURI = (String) session.getAttribute("redirectURI");
        }
        Admin user = adminService.setLoginSession(session);

        if (user != null) {
            session.setAttribute("user", user);
            session.setAttribute("userBoardCnt",boardService.getTotalCountByUserId(user.getUser_id()));
            session.setAttribute("userReplyCnt",replyService.getTotalCountReplyByUserId(user.getUser_id()));
            session.removeAttribute("userTagImgs");
            session.setAttribute("userTagImgs",galleryBoardService.getImgUrlByTag(tagService.getRandomTagValueByUserId(user.getUser_id()),0,9));
        }



        return "redirect:"+redirectURI;

    }


    // 회원가입 페이지
    @GetMapping("/register")
    public String register() {
        return "member/register";
    }

    @GetMapping("/accessDenied_page")
    public String access() {
        return "member/accessDenied_page";
    }

    @GetMapping("/logout")
    public String logout(HttpSession s) {
        log.info("/logout GET!");
        s.invalidate();
        return "redirect:/";
    }



}
