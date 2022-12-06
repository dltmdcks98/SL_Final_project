package com.slfinalproject.commurest.board.controller;

import com.slfinalproject.commurest.board.domain.Board;
import com.slfinalproject.commurest.board.service.BoardService;
import com.slfinalproject.commurest.tag.service.TagService;
import com.slfinalproject.commurest.util.paging.Page;
import com.slfinalproject.commurest.util.paging.PageMaker;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@Log4j2
@RequiredArgsConstructor
public class SearchController {

    private final BoardService boardService;

    // header 검색

    @GetMapping("/search")
    public String search(@RequestParam("keyword") String keyword, Model model, @ModelAttribute("p") Page page, HttpSession session){
        Map<String, Object> boardMap = boardService.searchAll(page, keyword);
        PageMaker pageMaker = new PageMaker(
                new Page(page.getPageNum(), page.getAmount())
                , (Integer) boardMap.get("tc"));
        model.addAttribute("b", boardMap.get("b"));
        model.addAttribute("pageMaker", pageMaker);
        session.setAttribute("redirectURIt","search-result");
        session.setAttribute("keyword",java.net.URLEncoder.encode(keyword));

        return "/search/search-result";
    }
}
