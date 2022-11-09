package com.slfinalproject.commurest.galleryBoard.controller;

import com.slfinalproject.commurest.galleryBoard.service.GalleryBoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/ajax-gallery")
@CrossOrigin
public class GalleryRestController {

    private final GalleryBoardService galleryBoardService;
    @GetMapping("")
    public List<String> getUrl(){

        String tag = "아이유";
        List<String> urlList = galleryBoardService.getImgUrl(tag);
        log.info("URL List : "+urlList + getClass().getName());

        return urlList;
    }

}
