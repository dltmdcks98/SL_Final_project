package com.slfinalproject.commurest.reply.domain;

import lombok.*;

@Setter @Getter @ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Reply {
/*    reply_no INT(10) AUTO_INCREMENT,
    reply_text VARCHAR(1000) NOT NULL,
    reply_writer VARCHAR(50) NOT NULL,
    reply_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    board_no INT(10) NOT NULL,
    user_account INT(10) NOT NULL,*/

    private int replyNo;
    private String replyText;
    private String replyWriter;
    private String replyDate;
    private int boardNo;
    private int userAccount;
}
