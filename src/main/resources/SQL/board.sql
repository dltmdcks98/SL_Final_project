CREATE TABLE board(
      board_no INT(10) AUTO_INCREMENT,
      user_id INT(10) NOT NULL,
      title VARCHAR(100) NOT NULL,
      content TEXT,
      hit INT(10) DEFAULT 0,
      reg_date DATETIME DEFAULT current_timestamp,
      recommend INT(10) DEFAULT 0,
      image_url VARCHAR(200),
      tag_id VARCHAR(300),
      CONSTRAINT pk_board PRIMARY KEY (board_no),
      CONSTRAINT fk_board_user_account FOREIGN KEY (user_id)
      REFERENCES user_account (user_id)
);
use spring10;
use finaldb;
CREATE TABLE board(
                      board_no INT(10) AUTO_INCREMENT,
                      user_id INT(10) NULL,
                      title VARCHAR(100) NOT NULL,
                      content TEXT,
                      hit INT(10) DEFAULT 0,
                      reg_date DATETIME DEFAULT current_timestamp,
                      recommend INT(10) DEFAULT 0,
                      image_url VARCHAR(200),
                      tag_id VARCHAR(300),
                      CONSTRAINT pk_board PRIMARY KEY (board_no)
);

select * from board;
insert into board(user_id, title, content)  values(1,'제목테스트','내용테스트');

ALTER TABLE board ADD CONSTRAINT fk_board_user_account FOREIGN KEY (user_id)
    REFERENCES user_account(user_id)
    ON DELETE CASCADE;


DROP TABLE board;
#ALTER  TABLE board RENAME COLUMN board_id TO board_no;

select * from board where board_no=2;