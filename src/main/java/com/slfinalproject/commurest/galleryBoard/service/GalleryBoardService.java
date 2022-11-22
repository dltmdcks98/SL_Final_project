package com.slfinalproject.commurest.galleryBoard.service;

import com.slfinalproject.commurest.tag.domain.Tag;
import com.slfinalproject.commurest.tag.dto.TagList;
import com.slfinalproject.commurest.tag.service.TagService;
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
import java.util.stream.Collectors;

@Service
@Log4j2
@RequiredArgsConstructor
@PropertySource("classpath:googleApi.properties")
public class GalleryBoardService {
    @Value("${LSC.google.API}")
    private String API;
    @Value("${LSC.google.domain}")
    private String domain;

    private final TagService tagService;

    public List<String> getImgUrl(String tag,int num,int size) {
        log.info("GalleryBoardService 진입, tag내용 : " +tag);

        List<String> imageUrl = new ArrayList<>();
        String searchUrl = "https://www.googleapis.com/customsearch/v1?key="+API+"&cx="+domain+"&searchType=image&filter=0&imgSize=large&q="+tag+"&start="+(num*10+1)+"&num="+size;
        log.info("검색 url : "+ searchUrl);
        try {
            Connection.Response res = Jsoup.connect(
                            searchUrl)
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
//                log.info("no : "+i +" url :"+ url+" num :"+num);
                imageUrl.add(url);
            }

        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return imageUrl;
    }

    public List<String> getImgUrls(String tag, int startPage,int size){
        List<String> tempurl = new ArrayList<>();
        String str = "";
        for(int num = startPage; num <startPage+1; num++){
            List<String> temp = getImgUrl(tag,num,size);
            for(int j=0; j<size; j++){ //검색 결과 list 분해
                str = temp.get(j);
                tempurl.add(str);
            }
        }
        List<String> urls = tempurl.stream().distinct().collect(Collectors.toList());
        return urls;
    }


    public List<String> getImgUrlsByUserId(int userId,int startPage, int size){
        List<Tag> tagList = tagService.getTagValueByUserId(userId);
        List<String> urlList = new ArrayList<>();
        for(int i=0; i<tagList.size();i++){
            String tag = tagList.get(i).getTagValue();
            List<String> temp = getImgUrl(tag,startPage,size);

            for(int j =0; j<temp.size();j++){
                urlList.add(temp.get(j));
            }
        }
        log.warn(urlList);
        return urlList;
    }

    public List<String> getImgUrlByHotTag(int startPage, int size){
        List<TagList> tagList = tagService.getHotTag();
        List<String> urlList = new ArrayList<>();
        if(size==9){
            log.info("index 에서 인기 태그");
            String firstTag = tagList.get(0).getTagValue();
            List<String> temp = getImgUrl(firstTag,startPage,size);
            for(String tag : temp) urlList.add(tag);

        }else{
            log.info("gallery에서 인기태그");
            for(int i=0; i<tagList.size();i++){
                String tag = tagList.get(i).getTagValue();
                List<String> temp = getImgUrl(tag,startPage,size);

                for(int j=0; j<temp.size();j++){
                    urlList.add(temp.get(j));
                }
            }
        }
        log.warn(urlList);
        return urlList;
    }

    public List <String> getImgUrlByTag(String tag, int startPage, int size){
        List<String> urlList = new ArrayList<>();
        List<String> temp = getImgUrl(tag,startPage,size);

        for(int j =0; j<temp.size();j++){
            urlList.add(temp.get(j));
        }
        log.warn(urlList);
        return urlList;
    }



}

