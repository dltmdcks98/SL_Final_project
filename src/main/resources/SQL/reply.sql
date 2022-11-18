CREATE TABLE reply(
    reply_no INT(10) AUTO_INCREMENT,
    reply_text VARCHAR(1000) NOT NULL,
    reply_writer VARCHAR(50) NOT NULL,
    reply_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    board_no INT(10) NOT NULL,
    user_account INT(10) NOT NULL,
    CONSTRAINT pk_reply PRIMARY KEY (reply_no),
    CONSTRAINT fk_reply_board FOREIGN KEY (board_no)
                  REFERENCES board(board_no)
                  ON DELETE CASCADE ,
    CONSTRAINT fk_reply_user FOREIGN KEY (user_account)
                  REFERENCES user_account(user_id)
                  ON DELETE CASCADE
                  ON UPDATE CASCADE
);

alter table reply
    change reply reply_no int(10) auto_increment;

DROP TABLE reply;
select * from reply where board_no=38;