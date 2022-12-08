create table user_account
(
    user_id    int(10) auto_increment
        primary key,
    manager    varchar(50)                          not null,
    user_birth date                                 null,
    user_name  varchar(50)                          not null,
    user_pass  varchar(150)                         not null,
    user_email varchar(100)                         not null,
    reg_date   datetime default current_timestamp() null,
    user_sex   varchar(1)                           not null
);

alter table user_account ADD COLUMN file_name varchar(150);
alter table user_account drop COLUMN file_name;
#매니저 타입 크기를 1->50으로 늘림
alter table user_account modify manager varchar(50);

# 매니저 초기값을 N -> ROLE_admin 으로 바꿈
alter table user_account alter column manager set default 'ROLE_ADMIN';

delete from user_account where manager='ROLE_KAKAO';

select *from user_account;


select * from tag;


UPDATE user_account
SET user_name='xxx2'
WHERE user_id=8;


DROP TABLE user_account;






