
-- 첨부파일 정보를 가지는 테이블 생성
create table file_upload
(
    file_name varchar(150)                         not null
        primary key,
    reg_date  datetime default current_timestamp() null,
    bno       int(10)                              not null,
    constraint fk_file_upload
        foreign key (bno) references board (board_no)
            on delete cascade
);


ALTER TABLE file_upload
    ADD CONSTRAINT pk_file_name
        PRIMARY KEY (file_name);

ALTER TABLE file_upload
    ADD CONSTRAINT fk_file_upload
        FOREIGN KEY (bno)
            REFERENCES board (board_no)
            ON DELETE CASCADE;

select * from file_upload order by reg_date desc;
select * from board;
select * from file_upload order by file_name limit 3;