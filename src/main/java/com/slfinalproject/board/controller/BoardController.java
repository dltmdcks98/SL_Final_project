package com.slfinalproject.board.controller;

import com.slfinalproject.util.paging.Page;
import com.slfinalproject.util.paging.PageMaker;
import com.slfinalproject.util.search.Search;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/board")
public class BoardController {

    @GetMapping("/board")
    public String board(Search search, Model model) {
        PageMaker pm = new PageMaker(new Page(search.getPageNum(),search.getAmount()));
//        model.addAttribute("bList", boardMap.get("bList"));
        model.addAttribute("pm", pm);
        return "board/board";
    }
}
