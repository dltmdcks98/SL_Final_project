package com.slfinalproject.commurest.admin.controller;


import com.slfinalproject.commurest.admin.domain.Admin;
import com.slfinalproject.commurest.admin.service.AdminService;
import com.slfinalproject.commurest.board.domain.Board;
import com.slfinalproject.commurest.board.service.BoardService;
import com.slfinalproject.commurest.reply.service.ReplyService;
import com.slfinalproject.commurest.util.paging.Page;
import com.slfinalproject.commurest.util.paging.PageMaker;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@Slf4j
public class MypageController {
    @Autowired
    private final AdminService adminService;

@Autowired
private final BoardService boardService;

@Autowired
private final ReplyService replyService;

    // 마이페이지 요청
    @GetMapping("/mypage")
    public String myPage(@ModelAttribute("p") Page page, Model model, HttpSession session) {
        Admin admin = adminService.setLoginSession(session);
        log.info(""+admin.getUser_id());
        Map<String, Object> replies = replyService.getAllByUserId(admin.getUser_id(),page);
        Map<String, Object> boardMap = boardService.findAllServiceByUserId(page, admin.getUser_id());

        PageMaker pageMaker = new PageMaker(
                new Page(page.getPageNum(), page.getAmount())
                , (Integer) boardMap.get("tc"));
        log.info("페이지 정보 : {}",pageMaker);
        model.addAttribute("bList", boardMap.get("bList"));
        model.addAttribute("rList", replies.get("rList"));
        model.addAttribute("pageMaker", pageMaker);

        return "member/myPage";
    }


    // 내가쓴글 페이지 요청
    @GetMapping("/mypage/myposting")
    public String myPosting(@ModelAttribute("p") Page page, Model model, HttpSession session) {
        Admin admin = adminService.setLoginSession(session);
        Map<String, Object> boardMap = boardService.findAllServiceByUserId(page, admin.getUser_id());

        PageMaker pageMaker = new PageMaker(
                new Page(page.getPageNum(), page.getAmount())
                , (Integer) boardMap.get("tc"));
        log.info("페이지 정보 : {}",pageMaker);
        model.addAttribute("bList", boardMap.get("bList"));
        model.addAttribute("pageMaker", pageMaker);

        return "member/myPosting";
    }


    // 내가쓴 댓글페이지 요청
    @GetMapping("/mypage/mycomment")
    public String myComment(@ModelAttribute("p") Page page, Model model, HttpSession session) {
        Admin admin = adminService.setLoginSession(session);
        log.info(""+admin.getUser_id());
        Map<String, Object> replies = replyService.getAllByUserId(admin.getUser_id(),page);

        model.addAttribute("rList", replies.get("rList"));

        return "member/myComment";
    }

    // 관심사설정페이지 요청
    @GetMapping("/mypage/myinfo_tag")
    public String myInfo_tag() {
        return "member/myInfo_tag";
    }


    // 회원탈퇴 페이지 요청
    @GetMapping("/mypage/myinfo_drop")
    public String myInfo_drop(HttpSession session) {
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
