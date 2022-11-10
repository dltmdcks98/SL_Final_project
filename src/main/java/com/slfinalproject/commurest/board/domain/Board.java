package com.slfinalproject.commurest.board.domain;


import lombok.*;

import java.util.Date;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
public class Board {
   private int boardNo;
//   private user_account user_id;
   private String title;
   private String content;
   private int hit;
   private Date regDate;
   private int recommend;
   private String image_url;
   private String tag_id;

   private String account;

}
