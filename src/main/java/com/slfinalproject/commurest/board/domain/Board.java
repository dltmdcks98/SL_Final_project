package com.slfinalproject.commurest.board.domain;


import lombok.*;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

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
   private String tagId;

   // 등록 날짜 포맷 변경
   private String simpleDate;

   // 게시글 상세보기
   private boolean showContent;

   // 게시판 전체 조회 userId -> userName 변경하기
   private String userName;

   // 게시판 댓글 수 조회
   private int replyCount;

   public Board(ResultSet rs) throws SQLException {
      this.boardNo = rs.getInt("board_no");
      this.userId = rs.getInt("user_id");
      this.title = rs.getString("title");
      this.content = rs.getString("content");
      this.hit = rs.getInt("hit");
      this.regDate = rs.getTimestamp("reg_date");
   }

}
