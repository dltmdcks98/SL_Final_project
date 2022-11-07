CREATE TABLE comment (
     comment_id INT(10) AUTO_INCREMENT,
     user_id INT(10) NOT NULL,
     c_content TEXT,
     reg_date DATETIME DEFAULT current_timestamp,
     recommend INT(10) DEFAULT 0,
     CONSTRAINT pk_comment PRIMARY KEY (comment_id),
     CONSTRAINT comment  FOREIGN KEY (user_id)
     REFERENCES user_account (user_id)
);

DROP TABLE comment;