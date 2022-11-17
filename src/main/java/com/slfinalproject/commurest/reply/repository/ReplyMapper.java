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
    List<Reply> findAll(@Param("boardNo") int boardNo, @Param("page") Page page);
    int getReplyCount(int boardNo);
    Reply findOne(int replyNo);
}
