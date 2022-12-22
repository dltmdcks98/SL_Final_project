package com.slfinalproject.commurest.admin.controller;


import com.slfinalproject.commurest.admin.domain.Admin;
import com.slfinalproject.commurest.admin.repository.AdminMapper;
import com.slfinalproject.commurest.admin.service.AdminService;
import com.slfinalproject.commurest.board.service.BoardService;
import com.slfinalproject.commurest.reply.service.ReplyService;
import com.slfinalproject.commurest.util.file.FileUploadController;
import com.slfinalproject.commurest.util.paging.Page;
import com.slfinalproject.commurest.util.paging.PageMaker;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@Slf4j
public class MypageController {
    private final AdminService adminService;


    private final BoardService boardService;

    private final ReplyService replyService;

    // 마이페이지 요청
    @GetMapping("/mypage")
    public String myPage(@ModelAttribute("p") Page page, Model model, HttpSession session) {
        Admin admin = adminService.setLoginSession(session);
        Map<String, Object> replies = replyService.getAllByUserId(admin.getUser_id(), page);
        Map<String, Object> boardMap = boardService.findAllServiceByUserId(page, admin.getUser_id());

        PageMaker pageMaker = new PageMaker(
                new Page(page.getPageNum(), page.getAmount())
                , (Integer) boardMap.get("myBoardTotalCount"));
        model.addAttribute("bList", boardMap.get("myBoardList"));
        model.addAttribute("rList", replies.get("rList"));
        model.addAttribute("pageMaker", pageMaker);

        return "member/myPage";
    }


    // 내가쓴글 페이지 요청
    @GetMapping("/mypage/myposting")
    public String myPosting(@ModelAttribute("p") Page page, Model model, HttpSession session) {
        Admin admin = (Admin) session.getAttribute("user");
        Map<String, Object> boardMap = boardService.findAllServiceByUserId(page, admin.getUser_id());

        PageMaker pageMaker = new PageMaker(
                new Page(page.getPageNum(), page.getAmount())
                , (int) boardMap.get("myBoardTotalCount"));
        model.addAttribute("bList", boardMap.get("myBoardList"));
        model.addAttribute("myBoardPageMaker", pageMaker);

        return "member/myPosting";
    }


    // 내가쓴 댓글페이지 요청
    @GetMapping("/mypage/mycomment")
    public String myComment(@ModelAttribute("p") Page page, Model model, HttpSession session) {
        Admin admin = (Admin) session.getAttribute("user");
        Map<String, Object> replies = replyService.getAllByUserId(admin.getUser_id(), page);
        PageMaker pageMaker = new PageMaker(
                new Page(page.getPageNum(), page.getAmount())
                , (int) replies.get("rListTotalCount"));
        model.addAttribute("rList", replies.get("rList"));
        model.addAttribute("myBoardPageMaker", pageMaker);

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
        if (user != null) {
            session.setAttribute("a", user);
        }
        return "member/myInfo_drop";
    }

    // 회원탈퇴 처리
    @PostMapping("/userDelete")
    public String userDel(Admin admin, HttpSession s) {
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


    @PostMapping("/update-kakao")
    public String nameUpdate(Admin admin, HttpSession s) {
        adminService.nameUpdate(admin);
        s.invalidate();
        return "redirect:/";
    }


    // 개인정보 수정 페이지 요청
    @GetMapping("/mypage/myinfo")
    public String myInfo(Model model, HttpSession session) {
        Admin user = adminService.setLoginSession(session);
        session.setAttribute("user", user);
        return "member/myInfo";
    }



    @GetMapping("/file/{userId}")
    @ResponseBody
    public ResponseEntity<String> getFiles(@PathVariable int userId) {
        String files = adminService.getFiles(userId);

        return new ResponseEntity<>(files, HttpStatus.OK);
    }


}
