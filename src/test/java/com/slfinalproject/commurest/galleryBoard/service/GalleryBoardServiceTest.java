package com.slfinalproject.commurest.galleryBoard.service;

import com.slfinalproject.commurest.board.domain.Board;
import com.slfinalproject.commurest.board.service.BoardService;
import com.slfinalproject.commurest.tag.domain.Tag;
import com.slfinalproject.commurest.tag.service.TagService;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.ArrayList;
import java.util.List;

@SpringBootTest
class GalleryBoardServiceTest {

    @Autowired
    private GalleryBoardService galleryBoardService;
    @Autowired
    private TagService tagService;

    @Autowired
    private BoardService boardService;

    @Test
    @DisplayName("검색결과 출력 조회")
    void getimglist(){
        List<String> result = new ArrayList<>();
        String str = "";
        for(int i=0; i<3; i++){ //검색 시작 페이지
            for(int j=0; j<10; j++){ //검색 결과 list 분해
                str = galleryBoardService.getImgUrl("아이유",i,10).get(j);
                result.add(str);
            }
        }
        for(String url:result) System.out.println(url);

        Assertions.assertNotNull(result);

    }

    @Test
    @DisplayName("tag bulk 값 입력, tag 삽입")
    void setTagValue(){
        boolean test = tagService.setTagValueByUserId("프로미스나인박지원",11);
//        boolean test1 = service.setTagValueByBoardNo("프로미스나인박지원",2);
        Assertions.assertTrue(test);
//        Assertions.assertTrue(test1);
    }
    @Test
    @DisplayName("tag value값 출력")
    void getTagValue(){
        String test = tagService.getTagValue(1);

        Assertions.assertEquals("아이유",test);
    }

    @Test
    @DisplayName("userId별 Tag List 출력")
    void tagListByUserId(){
        List<Tag> list = tagService.getTagValueByUserId(11);
        for(int i=0; i<list.size();i++){
            System.out.println(list.get(i));
        }
        Assertions.assertNotNull(list);
    }

    @Test
    @DisplayName("댓글 많은 글 출력")
    void getHotReplyBoard(){
        List<Board> temp = boardService.getHotReplyBoard();
        Assertions.assertNotNull(temp);
    }
}