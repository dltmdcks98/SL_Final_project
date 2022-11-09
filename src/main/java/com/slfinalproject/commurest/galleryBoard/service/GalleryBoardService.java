package com.slfinalproject.commurest.galleryBoard.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.json.JSONArray;
import org.json.JSONObject;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Service
@Log4j2
@RequiredArgsConstructor
public class GalleryBoardService {

    public List<String> getImgUrl(String tag) {
        String name=tag;

        List<String> imageUrl = new ArrayList<>();

        try {
            Connection.Response res = Jsoup.connect(
                    "https://www.googleapis.com/customsearch/v1?key=AIzaSyDR5HP1XN77UbnmTX9YFQowSvjW5Lz-YxU&cx=c0eb2a35954e0499f&imageType=face&searchType=image&imageSize=MEDIUM&q=" + name)
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
                System.out.println("no : "+i +" url :"+ url);
                imageUrl.add(url);
            }

        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return imageUrl;
    }
}

