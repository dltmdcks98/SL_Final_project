package com.slfinalproject.commurest.board.controller;

import com.slfinalproject.commurest.admin.domain.Admin;
import com.slfinalproject.commurest.admin.service.AdminService;
import com.slfinalproject.commurest.board.domain.Board;
import com.slfinalproject.commurest.board.service.BoardService;
import com.slfinalproject.commurest.recommend.service.RecommendService;
import com.slfinalproject.commurest.util.paging.Page;
import com.slfinalproject.commurest.util.paging.PageMaker;
import com.slfinalproject.commurest.util.search.Search;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/board")
public class BoardController {
    private final BoardService boardService;
    private final AdminService adminService;
    private final RecommendService recommendService;


    // 게시판 메인 페이지
    @GetMapping("")
    public String board(@ModelAttribute("s") Search search, Model model, HttpSession session) {
        Map<String, Object> boardMap = boardService.findAllService(search ,session);
        PageMaker pageMaker = new PageMaker(
                new Page(search.getPageNum(), search.getAmount())
                , (Integer) boardMap.get("tc"));
        model.addAttribute("bList", boardMap.get("bList"));
        model.addAttribute("pageMaker", pageMaker);
        session.setAttribute("redirectURIt", "board");
        return "board/board";
    }


    // 글 상세보기 페이지
    @GetMapping("/content/{boardNo}")
    public String content(@PathVariable("boardNo") int boardNo, Model model, @ModelAttribute("p") Page page, HttpServletResponse response, HttpServletRequest request) {
        Board board = boardService.selectOne(boardNo, response, request);
        Admin admin = adminService.selectOne2(board.getUserId());
        int recommendCount = recommendService.countRecommendBYBoardNo(boardNo);

        if (request.getSession().getAttribute("user") != null) {
            Admin user = (Admin) request.getSession().getAttribute("user");
            boolean recommendedUser = recommendService.confirmRecommend(boardNo, user.getUser_id());
            model.addAttribute("recommendedUser", recommendedUser);
        }

        board.setRecommend(recommendCount);
        model.addAttribute("b", board);
        model.addAttribute("a", admin);


        return "board/board_content";

    }

    // 글쓰기 페이지
    @GetMapping("/write")
    public String write(Board board, Model model,
                        HttpSession session, @ModelAttribute("p") Page page) {
        Admin user = (Admin) session.getAttribute("user");
        if (user != null) {
            model.addAttribute("a", user);
        }
        model.addAttribute("p", page);
        model.addAttribute("b", board);
        return "board/board_write";
    }



    // 글 쓰기 처리

    @PostMapping("/write")
    public String write(Board board,  RedirectAttributes ra, HttpSession session) {
        Admin user = (Admin) session.getAttribute("user");
        boolean flag = boardService.insertService(board, user.getUser_id());
        if (flag) ra.addFlashAttribute("msg", "reg-success");
        return flag ? "redirect:/board" : "redirect:/";
    }

    // 게시글 수정 화면 요청
    @GetMapping("/edit")
    public String edit(int boardNo, Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        Admin user = (Admin) session.getAttribute("user");
        Board board = boardService.selectOne(boardNo, response, request);
        model.addAttribute("a", user);
        model.addAttribute("board", board);
        model.addAttribute("bn", board.getBoardNo());

        return "board/board_edit";
    }

    // 수정 처리 요청
    @PostMapping("/edit")
    public String edit(@RequestParam int boardNo, Board board) {
        board.setBoardNo(boardNo);
        boolean flag = boardService.edit(board, boardNo);
        return flag ? "redirect:/board/content/" + board.getBoardNo() : "redirect:/";
    }


    //게시글 삭제 화면 요청
    @GetMapping("/remove")
    public String remove(@ModelAttribute("boardNo") int boardNo, Model model) {
        return "board/board_remove";
    }


    // 게시글 삭제 처리 요청
    @PostMapping("/remove")
    public String remove(int boardNo) {
        return boardService.remove(boardNo) ? "redirect:/board" : "redirect:/";
    }

    // 특정 게시물에 붙은 첨부파일경로 리스트를 클라이언트에게 비동기 전송

    @GetMapping("/file/{bno}")
    @ResponseBody
    public ResponseEntity<List<String>> getFiles(@PathVariable int bno) {
        List<String> files = boardService.getFiles(bno);
        return new ResponseEntity<>(files, HttpStatus.OK);
    }
}
