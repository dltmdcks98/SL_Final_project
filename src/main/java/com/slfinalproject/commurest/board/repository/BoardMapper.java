package com.slfinalproject.commurest.board.repository;

import com.slfinalproject.commurest.board.domain.Board;
import com.slfinalproject.commurest.util.paging.Page;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BoardMapper {
    // 게시글 쓰기
    boolean insert(Board board);

    // 게시글 전체 조회 paging 처리
    List<Board> selectAll(Page page);

    // 나의 게시글 조회
    List<Board> selectAllByUserId(Page page, int userId);

    // 하나만 조회

    Board selectOne(int boardNo);

    // 전체 게시물 수 조회
    int getTotalCount();

    // 내 게시물 수 조회
    int getTotalCountByUserId();


    // 게시글 한건 수정



    boolean edit(Board board);
    //게시글 한건 삭제

    boolean remove(int boardNo);
    // 게시글 조회수 갱신

    void hitCount(int boardNo);

    // 글쓰기 파일 추가
    void addFile(String fileName);


}
