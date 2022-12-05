CREATE TABLE recommend (
    recommend_no INT(10) AUTO_INCREMENT PRIMARY KEY,
    board_no INT(10) NOT NULL,
    user_id INT(10) NOT NULL,
    recommend_check INT(10) DEFAULT 0 NOT NULL,
    recommend_date DATETIME DEFAULT current_timestamp,
    CONSTRAINT fk_recommend_user_account FOREIGN KEY (user_id)
    REFERENCES user_account(user_id) ON DELETE CASCADE,
    CONSTRAINT fk_recommend_board FOREIGN KEY (board_no) REFERENCES board (board_no) ON DELETE CASCADE
);



INSERT INTO recommend(board_no,user_id) VALUES (125,51);
DELETE FROM recommend WHERE user_id=51;
SELECT COUNT(*) AS totalCount FROM recommend WHERE board_no=126;


SELECT * FROM recommend WHERE board_no=477 AND user_id=51;
