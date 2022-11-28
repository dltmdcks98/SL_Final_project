package com.slfinalproject.commurest.galleryBoard.controller;

import com.slfinalproject.commurest.admin.domain.Admin;
import com.slfinalproject.commurest.galleryBoard.service.GalleryBoardService;
import com.slfinalproject.commurest.tag.domain.Tag;
import com.slfinalproject.commurest.tag.service.TagService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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

    private final TagService tagService;

    @GetMapping("")
    public List<String> getUrl(int num, HttpSession session){
        int size=10;
        String tag = (String) session.getAttribute("tag");
        log.info("tag 값 확인 : {}",tag);

        Admin user = (Admin) session.getAttribute("user");
        if(user !=null && tag==null){
            log.info("현재 세션 정보 : "+user);
            int user_id = user.getUser_id();

            List<Tag> tagList = tagService.getTagValueByUserId(user_id);

            if(tagList.size()>2){
                size=3;
            } else if(tagList.size()==0){
                log.info("설정된 tag가 없음 :"+tagList);
                return galleryBoardService.getImgUrlByHotTag(num,size);
            }

            return galleryBoardService.getImgUrlsByUserId(user_id,num,size);
        }

        if(tag!=null){
            log.info("login 상태에서 검색 tag 정보 :" + tag);
            return galleryBoardService.getImgUrlByTag(tag,num,size);
        }

        log.info("RestController num :"+num+" size :"+size);
        return galleryBoardService.getImgUrlByHotTag(num,size);

    }

    @GetMapping("/index")
    public List<String> indexImg(HttpSession session){
        int num=0;
        int size = 9;
        log.info("rest gallery index 접근- GET ");
        if(session.getAttribute("userTag")!=null){
            String userTagValue = (String) session.getAttribute("userTag");
            return galleryBoardService.getImgUrlByTag(userTagValue,num,size);
        }
        return galleryBoardService.getImgUrlByHotTag(num,size);
    }

    @GetMapping("/{tag}")
    public String getOneUrl(@PathVariable("tag") String tag){
        log.info("getOneUrl - tag : {}",tag);
        String oneUrl = galleryBoardService.getImgUrlByTag(tag,0,1).get(0);
        return oneUrl;
    }
}
