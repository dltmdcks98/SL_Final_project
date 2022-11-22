package com.slfinalproject.commurest.galleryBoard.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/gallery")
public class GalleryController {

    @GetMapping("")
    public String galleryHome(HttpSession session) {
        log.info("Controller(gallery)");
        session.removeAttribute("tag");
        return "gallery_board/gallery";
    }

    @GetMapping("/search-tag")
    public String galleryByTag(@RequestParam("tag") String tag, HttpSession session){
        log.info("tag 갤러리 진입 tag 내용 : {}",tag );
        session.setAttribute("tag",tag);
        return "gallery_board/gallery";
    }

}


