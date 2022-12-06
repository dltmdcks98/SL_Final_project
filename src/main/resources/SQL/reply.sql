create table reply
(
    reply_no     int(10) auto_increment
        primary key,
    reply_text   varchar(1000)                        not null,
    reply_writer varchar(50)                          not null,
    reply_date   datetime default current_timestamp() null,
    board_no     int(10)                              not null,
    user_account int(10)                              not null,
    constraint fk_reply_board
        foreign key (board_no) references board (board_no)
            on update cascade on delete cascade,
    constraint fk_reply_user
        foreign key (user_account) references user_account (user_id)
            on update cascade on delete cascade
);


alter table reply
    change reply reply_no int(10) auto_increment;

DROP TABLE reply;
select * from reply where board_no=63;

SELECT board_no, count(*) AS replyCount FROM reply GROUP BY board_no ORDER BY replyCount DESC;

SELECT board_no, count(*) AS replyCount FROM reply GROUP BY board_no  ORDER BY replyCount DESC LIMIT 0, 5 ;