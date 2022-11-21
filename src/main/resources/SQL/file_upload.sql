
-- 첨부파일 정보를 가지는 테이블 생성
CREATE TABLE file_upload (
    file_name VARCHAR(150),
    reg_date DATETIME DEFAULT current_timestamp,
    bno int(10) NOT NULL
);

ALTER TABLE file_upload
    ADD CONSTRAINT pk_file_name
        PRIMARY KEY (file_name);

ALTER TABLE file_upload
    ADD CONSTRAINT fk_file_upload
        FOREIGN KEY (bno)
            REFERENCES board (board_no)
            ON DELETE CASCADE;

select * from file_upload

