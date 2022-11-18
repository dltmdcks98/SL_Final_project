package com.slfinalproject.commurest.reply.repository;

import com.slfinalproject.commurest.reply.domain.Reply;
import com.slfinalproject.commurest.util.paging.Page;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ReplyMapper {
    boolean save(Reply reply);
    boolean modify(Reply reply);
    boolean remove(int replyNo);

    // 게시글 삭제시 전체 댓글 삭제
    boolean removeAll(int boardNo);
    List<Reply> findAll(@Param("boardNo") int boardNo, @Param("page") Page page);
    int getReplyCount(int boardNo);
    Reply findOne(int replyNo);


//  나의 댓글 조회하기
    List<Reply> findReplyByUserId(Page page, int userAccount);
}
