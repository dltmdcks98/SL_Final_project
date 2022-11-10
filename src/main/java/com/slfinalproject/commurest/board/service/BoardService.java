package com.slfinalproject.commurest.board.service;

import com.slfinalproject.commurest.board.domain.Board;
import com.slfinalproject.commurest.board.repository.BoardMapper;
import com.slfinalproject.util.paging.Page;
import com.slfinalproject.util.search.Search;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service @Log4j2
public class BoardService {
    private BoardMapper boardMapper;

    public boolean saveService(Board board) {
        boolean flag = boardMapper.save(board);
        return flag;
    }

    // 게시물 전체 조회 요청 중간 처리
    public List<Board> findAllService() {
        log.info("findAll service start");
        List<Board> boardList = boardMapper.selectAll();


        return boardList;
    }

    // 게시물 전체 조회 요청 중간 처리 with paging --> 페이징이 밑의 searching에 포함되있어서 지워도됨
    public Map<String, Object> findAllService(Page page) {
        log.info("findAll service start");

        Map<String, Object> findDataMap = new HashMap<>();

        List<Board> boardList = boardMapper.selectAll(page);


        findDataMap.put("bList", boardList);


        return findDataMap;
    }

    // 게시물 전체 조회 요청 중간 처리 with searching
    public Map<String, Object> SelectAll(Search search) {
        log.info("findAll service start");

        Map<String, Object> findDataMap = new HashMap<>();

        List<Board> boardList = boardMapper.selectAll(search);


        findDataMap.put("bList", boardList);


        return findDataMap;
    }
}
