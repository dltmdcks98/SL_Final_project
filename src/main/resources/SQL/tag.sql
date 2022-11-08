CREATE TABLE tag (
     tag_id INT(10),
     tag_value VARCHAR(300),
     board_id INT(10),
     CONSTRAINT pk_tag PRIMARY KEY (tag_id),
     CONSTRAINT fk_tag_board FOREIGN KEY (board_id)
                 REFERENCES board(board_id)
                 ON DELETE CASCADE
);


DROP TABLE tag;