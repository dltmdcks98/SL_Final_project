package com.slfinalproject.commurest.reply.service;

import com.slfinalproject.commurest.reply.domain.Reply;
import com.slfinalproject.commurest.reply.repository.ReplyMapper;
import com.slfinalproject.commurest.util.paging.Page;
import com.slfinalproject.commurest.util.paging.PageMaker;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
@RequiredArgsConstructor
@Log4j2
public class ReplyService {
    private final ReplyMapper replyMapper;

//댓글 전체 조회
    public Map<String,Object> getAll(int boardNo, Page page){
        PageMaker maker = new PageMaker(page,getCount(boardNo));

        Map<String,Object> replyMap = new HashMap<>();
        replyMap.put("replyList",replyMapper.findAll(boardNo,page));
        replyMap.put("maker",maker);
        replyMap.put("count",replyMapper.getReplyCount(boardNo));

        return replyMap;
    }

    public int getCount(int boardNo){
        return replyMapper.getReplyCount(boardNo);
    }
//    댓글 작성
    public boolean write (Reply reply){
        return replyMapper.save(reply);
    }
//    댓글 삭제
    public boolean remove (Reply reply){
        return replyMapper.remove(reply);
    }
//    댓글 수정
    public boolean modify (Reply reply){
        return replyMapper.modify(reply);
    }

//    댓글 개별 조회
    public Reply findOne(int replyNo){
        return replyMapper.findOne(replyNo);
    }

}