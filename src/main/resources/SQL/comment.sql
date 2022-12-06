create table comment
(
    comment_id int(10) auto_increment
        primary key,
    user_id    int(10)                              not null,
    c_content  text                                 null,
    reg_date   datetime default current_timestamp() null,
    recommend  int(10)  default 0                   null,
    constraint comment
        foreign key (user_id) references user_account (user_id)
);




DROP TABLE comment;