package com.slfinalproject.commurest.board.service;

import com.slfinalproject.commurest.board.domain.Board;
import com.slfinalproject.commurest.board.repository.BoardMapper;
import com.slfinalproject.util.paging.Page;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service @Log4j2
@RequiredArgsConstructor
public class BoardService {
    private final BoardMapper boardMapper;

    // 게시글 등록
    public boolean insertService(Board board) {

        return boardMapper.insert(board);
    }

    // 게시글 전체 조회
    public List<Board> findAllService() {
        return boardMapper.selectAll();
    }

    // 게시물 전체 조회 요청 페이징
    public Map<String, Object> PagingService(Page page) {

        Map<String, Object> findDataMap = new HashMap<>();

        List<Board> boardList = boardMapper.Paging(page);
        findDataMap.put("bList", boardList);
        findDataMap.put("tc", boardMapper.getTotalCount());
        return findDataMap;
    }


}
