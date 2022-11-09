package com.slfinalproject.commurest.galleryBoard.service;

import org.json.JSONArray;
import org.json.JSONObject;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.io.IOException;
import java.util.List;


class GalleryBoardServiceTest {



    @Test
    @DisplayName("검색결과 출력 조회")
    void getimglist(){
       String name="아이유";
        List<String> imageUrl = null;
        try {
            Connection.Response res = Jsoup.connect(
                    "https://www.googleapis.com/customsearch/v1?key=AIzaSyDR5HP1XN77UbnmTX9YFQowSvjW5Lz-YxU&cx=c0eb2a35954e0499f&imageType=face&searchType=image&imageSize=MEDIUM&q=" + name).ignoreContentType(true).userAgent("Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36").execute();

            JSONObject json = new JSONObject(res.body());
            JSONArray items = json.getJSONArray("items");
            for (int i = 0; i < items.length(); i++) {
//                JSONObject item = items.getJSONObject(i);
//                JSONObject pagemap = item.getJSONObject("pagemap");
//                JSONArray metatags = pagemap.getJSONArray("metatags");
//                JSONObject metaData = metatags.getJSONObject(0);
//                String url = metaData.getString("og:image");
//                System.out.println("no : "+i +" url :"+ url);

            }

        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        Assertions.assertNotNull(imageUrl);


    }

}