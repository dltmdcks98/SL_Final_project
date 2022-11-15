CREATE TABLE tag (
     tag_id INT(10) AUTO_INCREMENT,
     tag_value VARCHAR(300),
     board_no INT(10),
     user_id INT(10),
     CONSTRAINT pk_tag PRIMARY KEY (tag_id),
     CONSTRAINT fk_tag_board FOREIGN KEY (board_no)
                 REFERENCES board(board_no)
                 ON DELETE CASCADE,
     CONSTRAINT fk_tag_user FOREIGN KEY (user_id)
                 REFERENCES user_account(user_id)
                 ON DELETE CASCADE
);

INSERT INTO tag(tag_value) VALUES ('아이유');

DROP TABLE tag;