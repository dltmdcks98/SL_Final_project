package com.slfinalproject.commurest.galleryBoard.controller;

import com.slfinalproject.commurest.galleryBoard.service.GalleryBoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/ajax-gallery")
public class GalleryRestController {
    private GalleryBoardService galleryBoardService;

    public ResponseEntity<List<String>> getUrl(String tag){

        List<String> urlList = galleryBoardService.getImgUrl(tag);

        return new ResponseEntity<>(urlList, HttpStatus.OK);
    }

}
