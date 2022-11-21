package com.slfinalproject.commurest.board.domain;


import lombok.*;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
public class Board {
   private int boardNo;
   private int userId;
   private String title;
   private String content;
   private int hit;
   private Date regDate;
   private int recommend;
   private String imageUrl;

   private List<String> tagList;

   // 등록 날짜 포맷 변경
   private String simpleDate;

   // 게시글 상세보기
   private boolean showContent;

   // 게시판 전체 조회 userId -> userName 변경하기
   private String userName;

   private int replyCnt; //각 게시물의 댓글 수

   // 첨부파일들의 이름 목록
   private List<String> fileNames;

   public Board(ResultSet rs) throws SQLException {
      this.boardNo = rs.getInt("board_no");
      this.userId = rs.getInt("user_id");
      this.title = rs.getString("title");
      this.content = rs.getString("content");
      this.hit = rs.getInt("hit");
      this.regDate = rs.getTimestamp("reg_date");
   }

}
