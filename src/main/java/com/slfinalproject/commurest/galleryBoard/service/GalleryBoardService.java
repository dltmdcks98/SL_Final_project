package com.slfinalproject.commurest.galleryBoard.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.json.JSONArray;
import org.json.JSONObject;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Service
@Log4j2
@RequiredArgsConstructor
@PropertySource("classpath:googleApi.properties")
public class GalleryBoardService {
    @Value("${LSC.google.API}")
    private String API;
    @Value("${LSC.google.domain}")
    private String domain;



    public List<String> getImgUrl(String tag,int num) {
        log.info("GalleryBoardService 진입, tag내용 : " +tag);
        String name=tag;
        int start = num;
        String imageSize = "medium";
        List<String> imageUrl = new ArrayList<>();

        try {
            Connection.Response res = Jsoup.connect(
                    "https://www.googleapis.com/customsearch/v1?key="+API+"&cx="+domain+"&imageType=face&searchType=image&imageSize="+imageSize+"&q=" + name+"&start="+(start*10+1))
                    .ignoreContentType(true).userAgent("Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36")
                    .execute();

            JSONObject json = new JSONObject(res.body());
            JSONArray items = json.getJSONArray("items");
            for (int i = 0; i < items.length(); i++) {
                JSONObject item = items.getJSONObject(i);
                String url = item.getString("link");
//                JSONObject pagemap = item.getJSONObject("pagemap");
//                JSONArray metatags = pagemap.getJSONArray("metatags");
//                JSONObject metaData = metatags.getJSONObject(0);
//                String url = metaData.getString("og:image");
                log.info("no : "+i +" url :"+ url+" num :"+start);
                imageUrl.add(url);
            }

        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return imageUrl;
    }

    public List<String> getImgUrls(String tag, int startpage){
        List<String> urls = new ArrayList<>();
        String str = "";
        for( int num = startpage; num <startpage+3; num++){ //검색 시작 페이지
            List<String> temp = getImgUrl(tag,num);
            for(int j=0; j<10; j++){ //검색 결과 list 분해
                str = temp.get(j);
                urls.add(str);
            }
        }
        return urls;
    }
}

