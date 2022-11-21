package com.slfinalproject.commurest.admin.controller;


import com.slfinalproject.commurest.admin.domain.Admin;
import com.slfinalproject.commurest.admin.service.AdminService;
import com.slfinalproject.commurest.util.paging.Page;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
@Slf4j
public class MypageController {
    @Autowired
    private final AdminService adminService;


    // 마이페이지 요청
    @GetMapping("/mypage")
    public String myPage() {
        return "member/myPage";
    }


    // 내가쓴글 페이지 요청
    @GetMapping("/mypage/myposting")
    public String myPosting() {
        return "member/myPosting";
    }


    // 내가쓴 댓글페이지 요청
    @GetMapping("/mypage/mycomment")
    public String myComment() {
        return "member/myComment";
    }

    // 관심사설정페이지 요청
    @GetMapping("/mypage/myinfo_tag")
    public String myInfo_tag() {
        return "member/myInfo_tag";
    }


    // 회원탈퇴 페이지 요청
    @GetMapping("/mypage/myinfo_drop")
    public String myInfo_drop(Model model, HttpSession session) {
        Admin user = adminService.setLoginSession(session);
        if(user!=null){
            session.setAttribute("a",user);
        }
        return "member/myInfo_drop";
    }

    // 회원탈퇴 처리
    @PostMapping("/userDelete")
    public String userDel(Admin admin, HttpSession s){
        adminService.delete(admin);
        s.invalidate();
        return "redirect:/";
    }


    // 개인정보 수정 처리 요청
    @PostMapping("/update")
    public String update(Admin admin, HttpSession s) {
        adminService.update(admin);
        s.invalidate();
        return "redirect:/";
    }


    // 개인정보 수정 페이지 요청
    @GetMapping("/mypage/myinfo")
    public String myInfo(Model model,HttpSession session) {
        Admin user = adminService.setLoginSession(session);
        if(user!=null){
            session.setAttribute("a",user);
        }

        return "member/myInfo";
    }

}
