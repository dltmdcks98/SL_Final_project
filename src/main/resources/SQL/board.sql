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
    ON DELETE CASCADE
);
use spring10;
use finaldb;
CREATE TABLE board (
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
select * from user_account;
delete from user_account where user_id='14';
select *
from user_account;
insert into board(user_id, title, content)  values(8,'제목테스트','내용테스트');



ALTER TABLE board ADD CONSTRAINT fk_board_user_account FOREIGN KEY (user_id)
    REFERENCES user_account(user_id)
    ON DELETE CASCADE;

select *from user_account where user_name='xxx';
alter table board modify user_id int(10) not null;

DROP TABLE board;
#ALTER  TABLE board RENAME COLUMN board_id TO board_no;

select * from board where board_no=249;

select * from comment;
select * from tag;
select * from board where board_no=2;


SELECT A.board_no, A.user_id, A.title, A.reg_date, A.hit, A.recommend, B.user_name
FROM board A
         JOIN user_account B ON A.user_id = B.user_id
WHERE A.user_id = 17
ORDER BY board_no DESC

select * from board where user_id=17;

select * from tag;

SELECT COUNT(*) FROM board where user_id=17;