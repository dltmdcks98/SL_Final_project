package com.slfinalproject.commurest;


import com.slfinalproject.commurest.admin.domain.Admin;
import com.slfinalproject.commurest.admin.service.AdminService;
import com.slfinalproject.commurest.board.domain.Board;
import com.slfinalproject.commurest.board.service.BoardService;
import com.slfinalproject.commurest.tag.dto.TagList;
import com.slfinalproject.commurest.tag.service.TagService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
@RequiredArgsConstructor
public class HomeController {

    private final TagService tagService;
    private final BoardService boardService;
    @GetMapping("/")
    public String home(HttpSession session, Model model){
        List<TagList> getTagList = tagService.getHotTag();
        session.setAttribute("hotTagList",getTagList);

        List<Board> getHitBoard = boardService.getHitBoard();
        session.setAttribute("hitBoard",getHitBoard);

        List<Board> getHotReplyBoard = boardService.getHotReplyBoard();
        model.addAttribute("hotReplyBoard",getHotReplyBoard);
        return "index";

    }



}
