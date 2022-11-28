CREATE TABLE recommend (
    recommend_no INT(10) PRIMARY KEY,
    bno INT(10) NOT NULL,
    user_id INT(10) NOT NULL,
    recommend_check INT(10) DEFAULT 0 NOT NULL,
    recommend_date DATETIME DEFAULT current_timestamp,
    CONSTRAINT fk_recommend_user_account FOREIGN KEY (user_id)
    REFERENCES user_account(user_id) ON DELETE CASCADE,
    CONSTRAINT fk_recommend_board FOREIGN KEY (bno) REFERENCES board (board_no) ON DELETE CASCADE
);
#