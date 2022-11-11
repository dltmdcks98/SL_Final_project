package com.slfinalproject.commurest.board.repository;

import com.slfinalproject.commurest.board.domain.Board;
import com.slfinalproject.util.paging.Page;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BoardMapper {
    boolean insert(Board board);

    // 전체 조회
    List<Board> selectAll();

    // 게시글 전체 조회 with paging
    List<Board> Paging(Page page);

    // 하나만 조회
    Board selectOne(int boardNo);

    // 전체 게시물 수 조회
    int getTotalCount();

}
