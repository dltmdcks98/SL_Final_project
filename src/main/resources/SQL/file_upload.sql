
-- 첨부파일 정보를 가지는 테이블 생성
CREATE TABLE file_upload (
    file_name VARCHAR(150),
    reg_date DATETIME DEFAULT current_timestamp,
    bno int(10) NOT NULL,
    CONSTRAINT file_name PRIMARY KEY (file_name),
    CONSTRAINT fk_file_upload FOREIGN KEY (bno) REFERENCES board (board_no) ON DELETE  CASCADE
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
# 프로필 사진 만드는거에 대해
# 여기에 user_id값을 넣는방법 -> ㅎㅌㅊ
# user_account에 profile_img 만들고 거기서 처리하기
# 프로필 이미지 sql 하나 만들기 file_no user_id fk, file_name