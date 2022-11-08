package com.slfinalproject.commurest.galleryBoard.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/gallery")
public class GalleryController {

    @GetMapping("/")
    public String galleryHome(){
        log.info("Controller(gallery) -"+getClass());
        return "gallery_board/gallery";
    }
}
