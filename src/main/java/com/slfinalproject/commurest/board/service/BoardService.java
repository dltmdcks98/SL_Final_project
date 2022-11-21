package com.slfinalproject.commurest.board.service;

import com.slfinalproject.commurest.admin.domain.Admin;
import com.slfinalproject.commurest.board.domain.Board;
import com.slfinalproject.commurest.board.repository.BoardMapper;
import com.slfinalproject.commurest.reply.repository.ReplyMapper;
import com.slfinalproject.commurest.util.paging.Page;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.util.WebUtils;

import javax.servlet.http.Cookie;
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

        boolean flag = boardMapper.insert(board);
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
    // 게시글 한건 상세보기
    @Transactional
    public Board selectOne(int boardNo, HttpServletResponse response, HttpServletRequest request) {
        Board board=boardMapper.selectOne(boardNo);
        hitCount(boardNo, response, request);
        return board;
    }

//====================================================================================================================//

    // 게시글 삭제 요청

    @Transactional
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
    public Board findOneService(int boardNo) {
        return boardMapper.selectOne(boardNo);
    }

//====================================================================================================================//

    // 게시글 조회수 갱신
    private void hitCount(int boardNo, HttpServletResponse response, HttpServletRequest request) {
        Cookie foundcookie = WebUtils.getCookie(request, "b" + boardNo);
        if(foundcookie == null) {
            boardMapper.hitCount(boardNo);

            Cookie cookie = new Cookie("b"+boardNo, String.valueOf(boardNo));
            cookie.setMaxAge(60/2);
            cookie.setPath("/board/content");
            response.addCookie(cookie);

        }
    }

//====================================================================================================================//

    // 첨부파일 가져오기

   public List<String> getFiles(int bno) {
        return boardMapper.fileNames(bno);
    }




//   각 게시물의 댓글 수 조회
    public void getReplyCount(Board b){
        b.setReplyCnt(replyMapper.getReplyCount(b.getBoardNo()));
    }
}
