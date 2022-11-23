package com.slfinalproject.commurest.tag.controller;

import com.slfinalproject.commurest.admin.domain.Admin;
import com.slfinalproject.commurest.tag.domain.Tag;
import com.slfinalproject.commurest.tag.dto.TagList;
import com.slfinalproject.commurest.tag.service.TagService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/ajax-tag")
public class TagRestController {
    private final TagService tagService;

    @GetMapping("")
    public String postTag(@RequestBody String tagValue){
        boolean status = tagService.setTagValue(tagValue);
        return status ? "insert-success" : "insert-fail";
    }

    @GetMapping("/popular-tag")
    public List<TagList> getPopularTag(){
        List<TagList> hotTag = tagService.getHotTag();
        return hotTag;
    }
    @GetMapping("/user-tag")
    public List<Tag> getUserTag(HttpSession session){
        Admin user = (Admin) session.getAttribute("user");
        List<Tag> userTag = tagService.getTagValueByUserId(user.getUser_id());
        return userTag;
    }
}
