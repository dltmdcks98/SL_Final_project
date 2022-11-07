CREATE TABLE board(
      board_id INT(10) AUTO_INCREMENT,
      user_id INT(10) NOT NULL,
      title VARCHAR(100) NOT NULL,
      content TEXT,
      hit INT(10) DEFAULT 0,
      reg_date DATETIME DEFAULT current_timestamp,
      recommend INT(10) DEFAULT 0,
      image_url VARCHAR(200),
      tag_id VARCHAR(300),
      CONSTRAINT pk_board PRIMARY KEY (board_id),
      CONSTRAINT board FOREIGN KEY (user_id)
      REFERENCES user_account (user_id)
);

DROP TABLE board;