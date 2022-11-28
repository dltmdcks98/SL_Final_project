# 사용자, 게시글 과 fk 연결
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

INSERT INTO tag(tag_value,user_id) VALUES ('이나경',18);

INSERT INTO board(user_id, title, content) VALUES (11,'test','asdf');
INSERT INTO tag(tag_value, board_no) VALUES ('test1', LAST_INSERT_ID());
SELECT LAST_INSERT_ID() FROM board;

SELECT tag_value, count(*) as count FROM tag WHERE user_id IS NULL GROUP BY tag_value ORDER BY count DESC LIMIT 0,6;

SELECT tag_value FROM tag WHERE board_no=131;

SELECT tag_value FROM tag WHERE user_id=51 ORDER BY RAND() LIMIT 1;

DROP TABLE tag;
