package com.slfinalproject.commurest;


import com.slfinalproject.commurest.admin.domain.Admin;
import com.slfinalproject.commurest.admin.service.AdminService;
import com.slfinalproject.commurest.board.domain.Board;
import com.slfinalproject.commurest.board.service.BoardService;
import com.slfinalproject.commurest.tag.dto.TagList;
import com.slfinalproject.commurest.tag.service.TagService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;


@Log4j2
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

        List<Board> findNewImage = boardService.findNewImage();
        model.addAttribute("findNewImage", findNewImage);

        return "index";

    }




}
