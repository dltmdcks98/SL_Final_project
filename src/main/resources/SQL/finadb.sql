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
DROP TABLE user_account;

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

CREATE TABLE tag (
    tag_id INT(10),
    tag_value VARCHAR(300),
    CONSTRAINT pk_tag PRIMARY KEY (tag_id)
);

DROP TABLE tag;