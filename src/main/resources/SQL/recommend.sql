CREATE TABLE recommend (
    recommend_no INT(10) AUTO_INCREMENT PRIMARY KEY,
    board_no INT(10) NOT NULL,
    user_name VARCHAR2(50) NOT NULL,
    CONSTRAINT fk_recommend_user_account FOREIGN KEY (user_name)
    REFERENCES user_account(user_id) ON DELETE CASCADE,
    CONSTRAINT fk_recommend_board FOREIGN KEY (board_no) REFERENCES board (board_no) ON DELETE CASCADE
);
