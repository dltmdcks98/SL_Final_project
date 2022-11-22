CREATE TABLE user_account(
    user_id INT(10) AUTO_INCREMENT,
    manager VARCHAR(1) not null default 'N',
    user_birth DATE,
    user_name VARCHAR(50) NOT NULL,
    user_pass VARCHAR(150) NOT NULL,
    user_email VARCHAR(100) NOT NULL,
    reg_date DATETIME DEFAULT current_timestamp,
    user_sex VARCHAR(1) NOT NULL,
    CONSTRAINT pk_tbl_user PRIMARY KEY (user_id)
    );

#매니저 타입 크기를 1->50으로 늘림
alter table user_account modify manager varchar(50);

# 매니저 초기값을 N -> ROLE_admin 으로 바꿈
alter table user_account alter column manager set default 'ROLE_ADMIN';

delete from user_account where user_id=26;

select *from user_account;


select * from tag;


UPDATE user_account
SET user_name='xxx2'
WHERE user_id=8;


DROP TABLE user_account;






