CREATE TABLE recommend (
    recommend_no INT(10) PRIMARY KEY,
    board_no INT(10) NOT NULL,
    user_id INT(10) NOT NULL,
    recommend_check INT(10) DEFAULT 0 NOT NULL,
    recommend_date DATETIME DEFAULT current_timestamp,
    CONSTRAINT fk_recommend_user_account FOREIGN KEY (user_id)
    REFERENCES user_account(user_id) ON DELETE CASCADE,
    CONSTRAINT fk_recommend_board FOREIGN KEY (board_no) REFERENCES board (board_no) ON DELETE CASCADE
);
#근데 user_id 어처피 user_name으로 하지않나?
# user_name VARCHAR(50) NOT NULL


INSERT INTO recommend(board_no,user_id) VALUES (125,51);
DELETE FROM recommend WHERE user_id=51;
SELECT COUNT(*) AS totalCount FROM recommend WHERE board_no=126;


SELECT * FROM recommend WHERE board_no=477 AND user_id=51;