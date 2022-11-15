package com.slfinalproject.commurest.galleryBoard.controller;

import com.slfinalproject.commurest.galleryBoard.service.GalleryBoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/ajax-gallery")
public class GalleryRestController {

    private final GalleryBoardService galleryBoardService;
    @GetMapping("")
    public List<String> getUrl(int num){
        int size=5;
        if(num==0)size=10;
        log.info("RestController num :"+num+" size :"+size);
        return galleryBoardService.getImgUrls(galleryBoardService.getTagValue(2),num,size);
    }

}
