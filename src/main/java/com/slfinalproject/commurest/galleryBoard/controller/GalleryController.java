package com.slfinalproject.commurest.galleryBoard.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/gallery")
public class GalleryController {

    @GetMapping("/list")
    public String galleryHome(){
        log.info("Controller(gallery) -"+getClass());
        return "gallery_board/gallery";
    }

    @GetMapping("/ajax-getImg")
    @ResponseBody
    public ResponseEntity<List<String>> getImage(String tag){
        String userAgent = "Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36";
        String url = "https://www.google.com/search?site=imghp&tbm=isch&source=hp&q="+tag+"&gws_rd=cr";

        log.info("AJAX Controller - "+getClass().getName()+"search :"+tag);
        List<String> imgList = new ArrayList<String>();
        try{
            Document doc = Jsoup.connect(url).userAgent(userAgent).referrer("https://www.google.com/").get();
            Elements img = doc.getElementsByTag("img");

            JSONObject jsonObject;
            for (Element element : img) {
                if (element.childNodeSize() > 0) {
                    jsonObject = (JSONObject) new JSONParser().parse(element.childNode(0).toString());
                    imgList.add((String) jsonObject.get("ou"));
                }

                for (Element e : img) {
                    imgList.add(e.attr("src"));
                }
            }
        } catch (IOException | ParseException e) {
            throw new RuntimeException(e);
        }
        return new ResponseEntity<>(imgList, HttpStatus.OK);
        }
    }

