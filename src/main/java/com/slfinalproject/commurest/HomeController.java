package com.slfinalproject.commurest;


import com.slfinalproject.commurest.tag.dto.TagList;
import com.slfinalproject.commurest.tag.service.TagService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
@RequiredArgsConstructor
public class HomeController {

    private final TagService tagService;
    @GetMapping("/")
    public String home(HttpSession session){
        List<TagList> getTagList = tagService.getHotTag();
/*        List<String> tempList=null;
        for(int i =0; i<getTagList.size(); i++){
              tempList.add(getTagList.get(i).getTagValue());
        }*/
        System.out.println(getTagList);
        session.setAttribute("hotTagList",getTagList);
        return "index";

    }



}
