create table recommend
(
    recommend_no int(10) auto_increment
        primary key,
    board_no     int(10) not null,
    user_id      int(10) not null,
    constraint fk_recommend_board
        foreign key (board_no) references board (board_no)
            on delete cascade,
    constraint fk_recommend_user_account
        foreign key (user_id) references user_account (user_id)
            on delete cascade
);



INSERT INTO recommend(board_no,user_id) VALUES (125,51);
DELETE FROM recommend WHERE user_id=51;
SELECT COUNT(*) AS totalCount FROM recommend WHERE board_no=126;


SELECT * FROM recommend WHERE board_no=477 AND user_id=51;