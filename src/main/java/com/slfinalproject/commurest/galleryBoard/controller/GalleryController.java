package com.slfinalproject.commurest.galleryBoard.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/gallery")
public class GalleryController {

    @GetMapping("")
    public String galleryHome() {
        log.info("Controller(gallery)");
        return "gallery_board/gallery";
    }

    @GetMapping("/search-tag")
    public String galleryByTag(@RequestParam("tag") String tag, Model model){
        log.info("tag 갤러리 진입 tag 내용 : {}",tag );
        model.addAttribute("tag",tag);
        return "gallery_board/gallery";
    }

}


