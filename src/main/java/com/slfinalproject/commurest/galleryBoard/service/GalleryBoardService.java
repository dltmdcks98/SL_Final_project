package com.slfinalproject.commurest.galleryBoard.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

import org.json.JSONObject;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Service
@Log4j2
@RequiredArgsConstructor
public class GalleryBoardService {

    public List<String> getImgUrl(String name) {
        List<String> imageUrl = null;
        try {
            Connection.Response res = Jsoup.connect(
                    "https://www.googleapis.com/customsearch/v1?key=AIzaSyDR5HP1XN77UbnmTX9YFQowSvjW5Lz-YxU&cx=c0eb2a35954e0499f&imageType=face&q=+" + name).ignoreContentType(true).userAgent("Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36").execute();

            JSONObject json = new JSONObject(res.body());
            for (int i = 0; i < 10; i++) {
                imageUrl.add(json.getJSONArray("items").getJSONObject(i).getJSONObject("pagemap").getJSONArray("cse_image").getJSONObject(0).getString("src"));
                log.info(imageUrl);
            }

        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return imageUrl;
    }
}

