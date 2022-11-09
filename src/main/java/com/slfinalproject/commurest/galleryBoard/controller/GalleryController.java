package com.slfinalproject.commurest.galleryBoard.controller;

import com.slfinalproject.commurest.galleryBoard.service.GalleryBoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/gallery")
public class GalleryController {

    private final GalleryBoardService galleryBoardService;

    @GetMapping("/list")
    public String galleryHome() {
        log.info("Controller(gallery) -" + getClass());
        return "gallery_board/gallery";
    }


}


