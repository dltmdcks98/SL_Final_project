package com.slfinalproject.commurest.tag.controller;

import com.slfinalproject.commurest.tag.service.TagService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
}
