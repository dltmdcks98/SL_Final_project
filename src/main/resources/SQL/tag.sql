# 사용자, 게시글 과 fk 연결
create table tag
(
    tag_id    int(10) auto_increment
        primary key,
    tag_value varchar(300) null,
    board_no  int(10)      null,
    user_id   int(10)      null,
    constraint fk_tag_board
        foreign key (board_no) references board (board_no)
            on delete cascade,
    constraint fk_tag_user
        foreign key (user_id) references user_account (user_id)
            on delete cascade
);





INSERT INTO tag(tag_value,user_id) VALUES ('이나경',18);

INSERT INTO board(user_id, title, content) VALUES (11,'test','asdf');
INSERT INTO tag(tag_value, board_no) VALUES ('test1', LAST_INSERT_ID());
SELECT LAST_INSERT_ID() FROM board;

SELECT tag_value, count(*) as count FROM tag WHERE user_id IS NULL GROUP BY tag_value ORDER BY count DESC LIMIT 0,6;

SELECT tag_value FROM tag WHERE board_no=131;

SELECT tag_value FROM tag WHERE user_id=51 ORDER BY RAND() LIMIT 1;

DROP TABLE tag;

INSERT INTO tag(tag_value) VALUES ('Welcom');