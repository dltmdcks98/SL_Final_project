create table board
(
    board_no  int(10) auto_increment
        primary key,
    user_id   int(10)  default 0                   not null,
    title     varchar(100)                         not null,
    content   text                                 null,
    hit       int(10)  default 0                   null,
    reg_date  datetime default current_timestamp() null,
    recommend int(10)  default 0                   null,
    image_url varchar(200)                         null,
    constraint fk_board_user_account
        foreign key (user_id) references user_account (user_id)
            on delete cascade
);


create table like_good(
    like_id int(10) auto_increment,
    board_no int(10) not null,
    user_id int(10) not null,
    constraint pk_like primary key (like_id),
    constraint fk_like_board foreign key (board_no)
            references board(board_no),
    constraint fk_like_user_account foreign key (user_id)
        references user_account(user_id)
                 on delete cascade
);
drop table like_good;

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

select * from tag;
select * from user_account;
select * from board;
select * from r


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
select * from board;

SELECT A.board_no, A.user_id, A.title, A.reg_date, A.hit, A.recommend, B.user_name
FROM board A
         JOIN user_account B ON A.user_id = B.user_id
WHERE A.user_id = 17
ORDER BY board_no DESC;

select * from board where user_id=17;

select * from tag;

SELECT COUNT(*) FROM board where user_id=17;

SELECT * FROM board WHERE hit>5 ORDER BY hit DESC;
SELECT user_name FROM user_account WHERE user_id=(
    SELECT user_id FROM board WHERE board_no=131
    );

# 검색기능
# 1. 제목에 검색어가 들어간 글들
# 2. 내용에 검색어가 들어간 글들
# 3. 태그에 검색어가 들어간 글들

select  A.board_no, A.title, A.content, B.tag_value
from board A
    left outer join tag B ON A.board_no = B.board_no
where A.title like '%아이유%' or A.content like '%아이유%' or B.tag_value like '%아이유%'
order by board_no DESC;





select  A.board_no, A.title, A.content, B.tag_value
from board A
         JOIN tag B ON A.board_no = B.board_no
where A.title like '%아이유%'
order by board_no DESC;

select  distinct A.board_no, A.title, A.content, B.tag_value
from board A
         left outer join tag B ON A.board_no = B.board_no
where A.title like '%아이유%' or A.content like '%아이유%' or B.tag_value like '%아이유%'
group by A.board_no desc;


# 내 게시물 수 가져오가
select count(*) as count
from board A
join user_account B ON A.user_id=b.user_id
where A.user_id=49;

select count(*) as count
from board
where user_id=49;


# 내 댓글 수 가져오기
select count(*) as count
from reply A
join user_account B On A.user_account = B.user_id
where A.user_account=49;

select *
from reply;




      select *from user_account;

select * from board where title like '%아이유%';

select * from tag;

select *
from board;

SELECT A.board_no, A.user_id, A.title, A.reg_date, A.hit, A.recommend, B.user_name
FROM board A
         JOIN user_account B ON A.user_id = B.user_id
WHERE A.user_id = 17
ORDER BY board_no DESC;

SELECT DISTINCT A.board_no, A.title, B.bno, B.file_name
FROM board A
JOIN file_upload B ON A.board_no = B.bno
ORDER BY  board_no DESC limit 3;


select * from file_upload order by reg_date desc;

SELECT DISTINCT COUNT(A.board_no)  FROM board A
                          LEFT JOIN user_account B ON A.user_id = B.user_id
                          LEFT JOIN tag C ON A.board_no = C.board_no;

SELECT DISTINCT A.board_no, A.user_id, A.title, A.reg_date, A.hit, A.recommend, B.user_name, C.tag_value
FROM board A
         LEFT JOIN user_account B ON A.user_id = B.user_id
         LEFT JOIN tag C ON A.board_no = C.board_no
        ORDER BY board_no DESC;

select *
from board where user_id=49;




