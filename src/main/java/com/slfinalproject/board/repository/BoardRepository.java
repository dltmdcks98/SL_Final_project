package com.slfinalproject.board.repository;

import com.slfinalproject.board.domain.Board;

import java.util.List;

public interface BoardRepository {
    boolean save(Board board);

    // 전체 조회
    List<Board> selectAll();
}
