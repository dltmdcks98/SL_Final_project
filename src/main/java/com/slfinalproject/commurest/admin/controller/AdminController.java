package com.slfinalproject.commurest.admin.controller;

import com.slfinalproject.commurest.admin.domain.Admin;
import com.slfinalproject.commurest.admin.service.AdminService;
import com.slfinalproject.commurest.util.HashManager;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@Controller
@RequiredArgsConstructor
@Slf4j
public class AdminController {
    @Autowired
    private final AdminService adminService;
    private HashManager hashManager;

    // 로그인 처리
//    @PostMapping("/admin/loginn")
//    public ResponseEntity adminLogin(Admin admin, HttpServletRequest req){
//        Admin obj = adminService.selectOne(admin);
//        System.out.println("로그인 결과 "+obj);
//
//        // 세션에 정보 담기
//        HttpSession session = req.getSession();
//        session.setAttribute("admin", obj);
//
//        ResponseEntity<String> entity = new ResponseEntity<String>("1", HttpStatus.OK);
//
//        return entity;
//    }


    // 회원가입 처리
    @PostMapping("/admin/regist")
    public String regist(Admin admin){
        log.info("/admin/regist POST - param: {}", admin);
        // 비밀번호 암호화 처리
        String hashedValue = hashManager.getConvertedPassword(admin.getUser_pass());
        admin.setUser_pass(hashedValue);
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

}
