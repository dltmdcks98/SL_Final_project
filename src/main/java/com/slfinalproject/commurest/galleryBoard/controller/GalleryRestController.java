package com.slfinalproject.commurest.galleryBoard.controller;

import com.slfinalproject.commurest.admin.domain.Admin;
import com.slfinalproject.commurest.galleryBoard.domain.Tag;
import com.slfinalproject.commurest.galleryBoard.service.GalleryBoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/ajax-gallery")
public class GalleryRestController {

    private final GalleryBoardService galleryBoardService;
    @GetMapping("")
    public List<String> getUrl(int num, HttpServletRequest request){
        int size=10;

        HttpSession session = request.getSession();
        Object securityContextObject = session.getAttribute(HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY);
        if(securityContextObject !=null){
            SecurityContext securityContext = (SecurityContext) securityContextObject;
            Authentication authentication = securityContext.getAuthentication();
             Admin user = (Admin) authentication.getPrincipal();
            log.warn("현재 세션 정보 : "+user);
            int user_id = user.getUser_id();
            List<Tag> tagList = galleryBoardService.getTagValueByUserId(user_id);
            if(tagList.size()>2)size=3;

            return galleryBoardService.getImgUrlsByUserId(user_id,num,size);
        }
        log.info("RestController num :"+num+" size :"+size);


        return galleryBoardService.getImgUrls(galleryBoardService.getTagValue(2),num,size);


    }


}
