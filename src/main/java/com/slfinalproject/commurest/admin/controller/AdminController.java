package com.slfinalproject.commurest.admin.controller;

import com.slfinalproject.commurest.admin.domain.Admin;
import com.slfinalproject.commurest.admin.service.AdminService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;


@Controller
@RequiredArgsConstructor
@Slf4j
public class AdminController {
    @Autowired
    private final AdminService adminService;



    // 회원가입 처리
    @PostMapping("/admin/regist")
    public String regist(Admin admin){
        log.info("/admin/regist POST - param: {}", admin);
        // 비밀번호 암호화 처리
//        String hashedValue = hashManager.getConvertedPassword(admin.getUser_pass());
   //     admin.setUser_pass(hashedValue);

        adminService.regist(admin);
        return "redirect:/";
    }


    // 로그인페이지
    @GetMapping("/login")
    public String login(){
        return "member/login";
    }
    // 회원가입 페이지
    @GetMapping("/register")
    public String register(){
        return "member/register";
    }

    @GetMapping("/accessDenied_page")
    public String access(){
        return "member/accessDenied_page";
    }

    @GetMapping ("/logout")
    public String logout(HttpSession s){
        log.info("/logout GET!");
        s.invalidate();
        return "redirect:/";
    }
    @PostMapping("/logout")
    public String logout(){
        log.info("/logout POST!");
        return "redirect:/";
    }

}
