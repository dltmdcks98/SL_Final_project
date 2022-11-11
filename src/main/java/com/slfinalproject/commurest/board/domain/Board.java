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

   public Board(ResultSet rs) throws SQLException {
      this.boardNo = rs.getInt("board_no");
      this.userId = rs.getInt("user_id");
      this.title = rs.getString("title");
      this.content = rs.getString("content");
      this.hit = rs.getInt("hit");
      this.regDate = rs.getTimestamp("reg_date");
   }

}
