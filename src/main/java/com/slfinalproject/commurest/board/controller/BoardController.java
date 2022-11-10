package com.slfinalproject.commurest.board.controller;

import com.slfinalproject.commurest.board.service.BoardService;
import com.slfinalproject.util.paging.Page;
import com.slfinalproject.util.paging.PageMaker;
import com.slfinalproject.util.search.Search;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

@Controller
@Log4j2
@RequiredArgsConstructor
//@RequestMapping("/board")
public class BoardController {
    private final BoardService boardService;

    // 게시판 메인 페이지
    @GetMapping("/board")
    public String board(Search search, Model model) {
//        PageMaker pm = new PageMaker(new Page(search.getPageNum(),search.getAmount()));
//        Map<String, Object> boardMap = boardService.SelectAll(search);
//        model.addAttribute("bList", boardMap.get("bList"));
//        model.addAttribute("pm", pm);
        return "board/board";
    }

    // 글 작성 페이지
    @GetMapping("board/write")
    public String write() {
        return "board/board_write";
    }

    // 글 보기 페이지
    @GetMapping ("/board/{boardNo}")
        public String content() {
            return "board/board_content";
        }
}
