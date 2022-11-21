package com.slfinalproject.commurest.board.controller;

import com.slfinalproject.commurest.admin.domain.Admin;
import com.slfinalproject.commurest.admin.service.AdminService;
import com.slfinalproject.commurest.board.domain.Board;
import com.slfinalproject.commurest.board.service.BoardService;
import com.slfinalproject.commurest.util.paging.Page;
import com.slfinalproject.commurest.util.paging.PageMaker;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/board")
public class BoardController {
    private final BoardService boardService;
    private final AdminService adminService;


    // 게시판 메인 페이지
    @GetMapping("")
    public String board(@ModelAttribute("p") Page page, Model model) {
        Map<String, Object> boardMap = boardService.findAllService(page);

        PageMaker pageMaker = new PageMaker(
                new Page(page.getPageNum(), page.getAmount())
                , (Integer) boardMap.get("tc"));
        log.info("페이지 정보 : {}",pageMaker);
        model.addAttribute("bList", boardMap.get("bList"));
        model.addAttribute("pageMaker", pageMaker);

        return "board/board";
    }

    // 글 상세보기 페이지
    @GetMapping("/content/{boardNo}")
    public String content(@PathVariable("boardNo") int boardNo, Model model, @ModelAttribute("p") Page page, HttpServletResponse response, HttpServletRequest request) {
        Board board = boardService.selectOne(boardNo,response,request);

        model.addAttribute("b", board);


        return "board/board_content";

    }

    // 글쓰기 페이지
    @GetMapping("/write")
    public String write(Board board, Model model,
                        HttpServletResponse response, HttpServletRequest request, @ModelAttribute("p") Page page) {
        HttpSession session = request.getSession();
        Object securityContextObject = session.getAttribute(HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY);
        if (securityContextObject != null) {
            SecurityContext securityContext = (SecurityContext) securityContextObject;
            Authentication authentication = securityContext.getAuthentication();
            Admin user = (Admin) authentication.getPrincipal();
            System.out.println("현재 세션 정보 : " + user);
            model.addAttribute("a", user);
        }
        model.addAttribute("p", page);
        model.addAttribute("b", board);

        return "board/board_write";
    }

    // 글 쓰기 처리

    @PostMapping("/writeForm")
    public String writeForm(Board board, HttpServletResponse response, HttpServletRequest request) {
        log.info("tag test "+ board);
        boardService.insertService(board, response, request);

        return "redirect:/board";
    }

    // 게시글 수정 화면 요청
    @GetMapping("/edit")
    public String edit(int boardNo, Model model) {
        log.info("boardNo : {}",boardNo);
        Board board = boardService.findOneService(boardNo);
        model.addAttribute("board", board);
        return "board/board_edit";
    }

    // 수정 처리 요청
    @PostMapping("/edit")
    public String edit(Board board) {
        log.info("controller request POST 요청 : {}", board);
        boolean flag = boardService.edit(board);
        return flag ? "redirect:/board/content/" + board.getBoardNo() : "redirect:/";
    }


    //게시글 삭제 화면 요청
    @GetMapping("/remove")
    public String remove(@ModelAttribute("boardNo") int boardNo, Model model) {

        log.info("controller request delete : {}", boardNo);

        return "board/board_remove";
    }


    // 게시글 삭제 처리 요청
    @PostMapping("/remove")
    public String remove(int boardNo) {
        log.info("controller request delete POST : {}", boardNo);

        return boardService.remove(boardNo) ? "redirect:/board" : "redirect:/";
    }

    // 특정 게시물에 붙은 첨부파일경로 리스트를 클라이언트에게 비동기 전송
    /*
    @GetMapping("/file/{bno}")
    @ResponseBody
    public ResponseEntity<List<String>> getFiles(@PathVariable int bno) {

        List<String> files = boardService.getFiles(bno);
        log.info("/board/file/{} GET! ASYNC - {}", bno, files);

        return new ResponseEntity<>(files, HttpStatus.OK);
    }
     */
}
