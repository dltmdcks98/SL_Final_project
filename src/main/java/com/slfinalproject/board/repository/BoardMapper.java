package com.slfinalproject.board.repository;

import com.slfinalproject.board.domain.Board;

import java.util.List;

public interface BoardMapper {
    // true, false로 구분 하여 일치하면 게시글 쓰기
    boolean save(Board board);

    // 전체 조회
    List<Board> selectAll();

}
