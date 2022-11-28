package com.slfinalproject.commurest.board.service;

import com.slfinalproject.commurest.admin.domain.Admin;
import com.slfinalproject.commurest.admin.repository.AdminMapper;
import com.slfinalproject.commurest.board.domain.Board;
import com.slfinalproject.commurest.board.repository.BoardMapper;
import com.slfinalproject.commurest.recommend.repository.RecommendMapper;
import com.slfinalproject.commurest.reply.dto.ReplyDTO;
import com.slfinalproject.commurest.reply.repository.ReplyMapper;
import com.slfinalproject.commurest.tag.domain.Tag;
import com.slfinalproject.commurest.tag.repository.TagMapper;
import com.slfinalproject.commurest.util.paging.Page;
import com.slfinalproject.commurest.util.search.Search;
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
import java.util.*;

@Service
@Log4j2
@RequiredArgsConstructor
public class BoardService {


    private final BoardMapper boardMapper;
    private final TagMapper tagMapper;

    private final ReplyMapper replyMapper;
    private final AdminMapper adminMapper;
    private final RecommendMapper recommendMapper;


    // 게시글 등록
    @Transactional
    public boolean insertService(Board board,
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

        // 게시글을 DB에 저장
        boolean flag = boardMapper.insert(board);
        int boardno = tagMapper.getBoardNo();
        if(board.getTagList()!=null){
            for(int i=0; i< board.getTagList().size();i++){
                tagMapper.setTagValueByBoardNo(board.getTagList().get(i),boardno);
            }
        }
        List<String> fileNames = board.getFileNames();
        if (fileNames != null && fileNames.size() > 0) {
            for (String fileName : fileNames) {
                // 첨부파일 내용 DB에 저장
                boardMapper.addFile(fileName);
            }
        }

        log.info("user_id : "+board.getUserId());
        return flag;
    }


    /*
    // 게시물 전체 조회 요청 페이징
    public Map<String, Object> findAllService(Page page) {

        Map<String, Object> findDataMap = new HashMap<>();
        List<Board> boardList = boardMapper.selectAll(page);

        process(boardList);
        findDataMap.put("bList", boardList);
        findDataMap.put("tc", boardMapper.getTotalCount());
        return findDataMap;
    }

     */

    // 게시물 전체 조회 요청 페이징 + 검색기능
    public Map<String, Object> findAllService(Search search) {

        Map<String, Object> findDataMap = new HashMap<>();
        List<Board> boardList = boardMapper.selectAll(search);

        process(boardList);
        findDataMap.put("bList", boardList);
        findDataMap.put("tc", boardMapper.getTotalCountSearch(search));
        return findDataMap;
    }






    // header 검색
    public Map<String, Object> searchAll(Page page, String keyword){
        Map<String, Object> findDataMap = new HashMap<>();
        List<Board> boardList = boardMapper.searchAll(page, keyword);

        for(Board board : boardList){
            List<Tag> getTagList = tagMapper.getTagValueByBoardNo(board.getBoardNo());
            List<String> tagList = new ArrayList<>();
            for(Tag tag : getTagList)tagList.add(tag.getTagValue());
            board.setTagList(tagList);
        }



        process(boardList);
        findDataMap.put("b", boardList);
        findDataMap.put("tc", boardMapper.getTotalCount());

        return findDataMap;
    }




    // 나의 게시글 조회
    public Map<String, Object> findAllServiceByUserId(Page page,int userId) {

        Map<String, Object> findDataMap = new HashMap<>();
        List<Board> boardList = boardMapper.selectAllByUserId(page, userId);
        int total = boardMapper.getTotalCountByUserId(userId);
        log.info("total test : {}",total);
        process(boardList);
        findDataMap.put("myBoardList", boardList);
        findDataMap.put("myBoardTotalCount", total);
        return findDataMap;
    }



    // 날짜 포맷 생성     == 이후에 추가로 할 것 : 당일날 작성한 글은 'HH:mm'만 나오고 다음날로 넘어가면(24:00) 가 되면 'yy-MM-dd'로 변경
    private void dateFormat(Board board) {
        Date date = board.getRegDate();
        SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd'  'HH:mm");
        board.setSimpleDate(sdf.format(date));
    }



    // 날짜, 댓글, 조회수 ... 갱신? 목적 --> 지금은 날짜 포맷만 넣었음
    private void process(List<Board> boardList) {
        for (Board board : boardList) {
            dateFormat(board);
            getReplyCount(board);
        }
    }


    // 게시글 한건 상세보기
    @Transactional
    public Board selectOne(int boardNo, HttpServletResponse response, HttpServletRequest request) {

        Board board = boardMapper.selectOne(boardNo);
        List<Tag> getTagList = tagMapper.getTagValueByBoardNo(boardNo);
        List<String> tagList = new ArrayList<>();
        for(Tag tag : getTagList)tagList.add(tag.getTagValue());

        board.setTagList(tagList);
        dateFormat(board);

        hitCount(boardNo, response, request);
        return board;
    }



    // 게시글 삭제 요청

    @Transactional
    public boolean remove(int boardNo) {
        return boardMapper.remove(boardNo);
    }


    // 게시글 수정 요청

    public boolean edit(Board board) {
        return boardMapper.edit(board);
    }


    @Transactional
    public Board findOneService(int boardNo) {
        return boardMapper.selectOne(boardNo);
    }



    // 게시글 조회수 갱신

    private void hitCount(int boardNo, HttpServletResponse response, HttpServletRequest request) {
        Cookie foundcookie = WebUtils.getCookie(request, "b" + boardNo);
        if(foundcookie == null) {
            boardMapper.hitCount(boardNo);

            Cookie cookie = new Cookie("b" + boardNo, String.valueOf(boardNo));
            cookie.setMaxAge(60 / 2);
            cookie.setPath("/board/content");
            response.addCookie(cookie);

        }
    }

    // 첨부파일 가져오기

   public List<String> getFiles(int bno) {
        return boardMapper.fileNames(bno);
    }



    // 최근에 쓴 이미지가 들어간 게시글 출력

    public List<Board> findNewImage() {
        return boardMapper.findNewImage();
    }



    // 각 게시물의 댓글 수 조회
    public void getReplyCount(Board b) {
        b.setReplyCnt(replyMapper.getReplyCount(b.getBoardNo()));
    }



    // 인기 게시글 조회
    public List<Board> getHitBoard(){
        List<Board> getHitBoard = boardMapper.getHitBoard();

        for(Board b : getHitBoard){
            titleConvert(b);
            getUserName(b);
            dateConvert(b);
        }
        return getHitBoard;
    }
    private void titleConvert(Board b){
        String title = b.getTitle();
        if(title.length()>10){
            String temp = title.substring(0,9)+"...";
            b.setTitle(temp);
        }
    }
    public void getUserName(Board board){
        board.setUserName(boardMapper.findMemberByBoardNo(board.getBoardNo()));
    }
    public void dateConvert(Board board){
        Date date = board.getRegDate();
        SimpleDateFormat sdf = new SimpleDateFormat("MM-dd HH:mm");
        board.setSimpleDate(sdf.format(date));
    }

    public List<Board> getHotReplyBoard(){
        List<ReplyDTO> getReplyBoard = replyMapper.getBoardNoByReplyCount();
        List<Board> boardList = new ArrayList<>();
        for(ReplyDTO replyDTO : getReplyBoard){
            Board board = boardMapper.selectOne(replyDTO.getBoardNo());
            board.setReplyCnt(replyDTO.getReplyCount());
            boardList.add(board);
        }
        return boardList;
    }

}
