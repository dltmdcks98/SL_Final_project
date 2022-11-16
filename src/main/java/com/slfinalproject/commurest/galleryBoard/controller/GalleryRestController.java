package com.slfinalproject.commurest.galleryBoard.controller;

import com.slfinalproject.commurest.admin.domain.Admin;
import com.slfinalproject.commurest.galleryBoard.domain.Tag;
import com.slfinalproject.commurest.galleryBoard.service.GalleryBoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/ajax-gallery")
public class GalleryRestController {

    private final GalleryBoardService galleryBoardService;
    @GetMapping("")
    public List<String> getUrl(int num, HttpSession session){
        int size=10;

        Admin user = (Admin) session.getAttribute("user");
        if(user !=null){
            log.info("현재 세션 정보 : "+user);
            int user_id = user.getUser_id();

            List<Tag> tagList = galleryBoardService.getTagValueByUserId(user_id);

            if(tagList.size()>2)size=3;

            return galleryBoardService.getImgUrlsByUserId(user_id,num,size);
        }
        log.info("RestController num :"+num+" size :"+size);


        return galleryBoardService.getImgUrls(galleryBoardService.getTagValue(2),num,size);


    }


}
