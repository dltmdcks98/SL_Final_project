package com.slfinalproject.commurest.util.paging;

import com.slfinalproject.commurest.board.repository.BoardMapper;
import com.slfinalproject.commurest.util.paging.Page;
import com.slfinalproject.commurest.util.paging.PageMaker;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class PageMakerTest {

    @Autowired
    BoardMapper boardMapper;

    @Test
    void pageInfoTest() {

        int totalCount = boardMapper.getTotalCount();
        PageMaker pageMaker = new PageMaker(new Page(13, 20), totalCount);

        System.out.println(pageMaker);
    }


}