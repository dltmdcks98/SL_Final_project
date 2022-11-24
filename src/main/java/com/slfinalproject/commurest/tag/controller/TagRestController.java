package com.slfinalproject.commurest.tag.controller;

import com.slfinalproject.commurest.admin.domain.Admin;
import com.slfinalproject.commurest.tag.domain.Tag;
import com.slfinalproject.commurest.tag.dto.TagList;
import com.slfinalproject.commurest.tag.service.TagService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.web.bind.annotation.*;

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
        List<TagList> hotTag = tagService.getHotTagByUser();
        return hotTag;
    }
    @GetMapping("/user-tag")
    public List<Tag> getUserTag(HttpSession session){
        Admin user = (Admin) session.getAttribute("user");
        List<Tag> userTag = tagService.getTagValueByUserId(user.getUser_id());
        return userTag;
    }
    @GetMapping("/tag-delete/{tagvalue}")
    public String deleteTag(@PathVariable("tagvalue")String tag,HttpSession session){
        Admin admin = (Admin) session.getAttribute("user");
        log.info(admin.getUser_id());
        boolean result = tagService.deleteTag(admin.getUser_id(),tag);
        log.info(result);
        return result ? "success-delete" : "fail-delete";
    }
    @GetMapping("/tag-regist/{tagValue}")
    public String registTag(@PathVariable("tagValue")String tagValue, HttpSession session){
        Admin admin = (Admin) session.getAttribute("user");
        int userId = admin.getUser_id();
        boolean result = tagService.setTagValueByUserId(tagValue,userId);
        return result ? "success-insert" : "fail-insert";
    }
}
