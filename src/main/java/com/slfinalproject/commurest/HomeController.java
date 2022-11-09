package com.slfinalproject.commurest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
    @GetMapping("/")
    public String home(){
        return "index";
    }

    @GetMapping("/board")
    public String board(){
        return "board";
    }

    @GetMapping("/gallery")
    public String gallery(){
        return "Masonry-gallery/gallery";
    }
}
