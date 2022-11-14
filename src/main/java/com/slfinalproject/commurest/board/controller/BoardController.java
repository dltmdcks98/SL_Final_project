package com.slfinalproject.commurest.board.controller;

import com.slfinalproject.commurest.admin.domain.Admin;
import com.slfinalproject.commurest.board.domain.Board;
import com.slfinalproject.commurest.board.service.BoardService;
import com.slfinalproject.util.paging.Page;
import com.slfinalproject.util.paging.PageMaker;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@Log4j2
@RequiredArgsConstructor
public class BoardController {
    private final BoardService boardService;

    // 게시판 메인 페이지
    @GetMapping("/board")
    public String board(@ModelAttribute("p") Page page, Model model) {
        List<Board> bList = boardService.findAllService();
        model.addAttribute("bList", bList);
        return "board/board";
    }

    // 글 작성 페이지
    @GetMapping("board/write")
    public String write() {
        return "board/board_write";
    }

    // 글 보기 페이지
    @GetMapping("/board/{boardNo}")
    public String content(@PathVariable("boardNo") int boardNo, Model model,
                          HttpServletResponse response, HttpServletRequest request) {
        HttpSession session = request.getSession();
        Object securityContextObject = session.getAttribute(HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY);
        if(securityContextObject !=null){
            SecurityContext securityContext = (SecurityContext) securityContextObject;
            Authentication authentication = securityContext.getAuthentication();
            Admin user = (Admin) authentication.getPrincipal();
            System.out.println("현재 세션 정보 : "+user);
            model.addAttribute("a",user);
        }
        Board board = boardService.selectOne(boardNo);
        System.out.println("번호 : "+board.getBoardNo()+"제목 : "+board.getTitle());
        model.addAttribute("b", board);


        return "board/board_content";

    }



    @GetMapping("/board/test")
    public String test() {
        return "board/board_test";
    }
}
