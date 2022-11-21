package com.slfinalproject.commurest.board.service;

import com.slfinalproject.commurest.admin.domain.Admin;
import com.slfinalproject.commurest.board.domain.Board;
import com.slfinalproject.commurest.board.repository.BoardMapper;
import com.slfinalproject.commurest.reply.repository.ReplyMapper;
import com.slfinalproject.commurest.tag.repository.TagMapper;
import com.slfinalproject.commurest.util.paging.Page;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Log4j2
@RequiredArgsConstructor
public class BoardService {


    private final BoardMapper boardMapper;
    private final TagMapper tagMapper;

    private final ReplyMapper replyMapper;

    // 게시글 등록
    @Transactional
    public void insertService(Board board,
                                 HttpServletResponse response, HttpServletRequest request) {
        HttpSession session = request.getSession();
        Object securityContextObject = session.getAttribute(HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY);
      //  if(securityContextObject !=null){
            SecurityContext securityContext = (SecurityContext) securityContextObject;
            Authentication authentication = securityContext.getAuthentication();
            Admin user = (Admin) authentication.getPrincipal();
            //board.setUserId(user.getUser_id());
     //   }

        board.setUserId(user.getUser_id());
        log.info("tagList 테스트 "+ board.getTagList());

        boardMapper.insert(board);
        int boardno = tagMapper.getBoardNo();
        for(int i=0; i< board.getTagList().size();i++){
            tagMapper.setTagValueByBoardNo(board.getTagList().get(i),boardno);
        }
        log.info("user_id : "+board.getUserId());

    }

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
        for (Board board: boardList) {
            dateFormat(board);
            getReplyCount(board);
        }
    }
//====================================================================================================================//
    // 게시글 작성
    public Board selectOne(int boardNo) {
        return boardMapper.selectOne(boardNo);
    }

//====================================================================================================================//

    // 게시글 삭제 요청    - 댓글이 달려있을 경우 삭제처리 안됨

    public boolean remove(int boardNo) {
        return boardMapper.remove(boardNo);
    }
//====================================================================================================================//

    // 게시글 수정 요청

    public boolean edit(Board board) {
        return boardMapper.edit(board);
    }
    //====================================================================================================================//
    @Transactional
    public Board findOneService(int boardNo, HttpServletResponse response, HttpServletRequest request) {
        log.info("findOne service start - {}", boardNo);
        return boardMapper.selectOne(boardNo);
    }


//   각 게시물의 댓글 수 조회
    public void getReplyCount(Board b){
        b.setReplyCnt(replyMapper.getReplyCount(b.getBoardNo()));
    }
}
