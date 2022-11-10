package com.slfinalproject.commurest.board.repository;

import com.slfinalproject.commurest.board.domain.Board;
import com.slfinalproject.util.paging.Page;
import com.slfinalproject.util.search.Search;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BoardMapper {
    // true, false로 구분 하여 일치하면 게시글 쓰기
    boolean save(Board board);

    // 전체 조회
    List<Board> selectAll();

    // 게시글 전체 조회 with paging
    List<Board> selectAll(Page page);
    // 게시글 전체 조회 with searching
    List<Board> selectAll(Search search);

    // 하나만 조회
    Board selectOne(int boardNo);

}
