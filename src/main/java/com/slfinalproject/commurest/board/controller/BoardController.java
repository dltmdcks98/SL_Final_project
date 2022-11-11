package com.slfinalproject.commurest.board.controller;

import com.slfinalproject.commurest.board.domain.Board;
import com.slfinalproject.commurest.board.service.BoardService;
import com.slfinalproject.util.paging.Page;
import com.slfinalproject.util.paging.PageMaker;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

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
//        Map<String, Object>boardMap = boardService.PagingService(page);
//        PageMaker pm = new PageMaker(new Page(page.getPageNum(), page.getAmount()),(Integer) boardMap.get("tc"));
//        model.addAttribute("pm", pm);
          List<Board> bList= boardService.findAllService();
          model.addAttribute("bList", bList);
        return "board/board";
    }

    // 글 작성 페이지
    @GetMapping("board/write")
    public String write() {
        return "board/board_write";
    }

    // 글 보기 페이지
    @GetMapping ("/board/{boardNo}")
        public String content(@PathVariable String boardNo) {
            return "board/board_content";
        }

    @GetMapping("/board/test")
        public String test() {
        return "board/board_test";
    }
}
