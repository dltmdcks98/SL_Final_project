package com.slfinalproject.commurest.board.service;

import com.slfinalproject.commurest.board.domain.Board;
import com.slfinalproject.commurest.board.repository.BoardMapper;
import com.slfinalproject.commurest.util.paging.Page;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
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


    // 게시물 전체 조회 요청 페이징
    public Map<String, Object> findAllService(Page page) {

        Map<String, Object> findDataMap = new HashMap<>();

        List<Board> boardList = boardMapper.selectAll(page);
        process(boardList);
        findDataMap.put("bList", boardList);
        findDataMap.put("tc", boardMapper.getTotalCount());
        return findDataMap;
    }
//====================================================================================================================//

    // 날짜 포맷 생성     == 이후에 추가로 할 것 : 당일날 작성한 글은 'HH:mm'만 나오고 다음날로 넘어가면(24:00) 가 되면 'yy-MM-dd'로 변경
    private void dateFormat(Board board) {
        Date date = board.getRegDate();
        SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd'  'HH:mm");
        board.setSimpleDate(sdf.format(date));
    }

//====================================================================================================================//
    // 날짜, 댓글, 조회수 ... 갱신? 목적 --> 지금은 날짜 포맷만 넣었음
    private void process(List<Board> boardList) {
        for (Board board: boardList
             ) {
            dateFormat(board);
        }
    }


}
