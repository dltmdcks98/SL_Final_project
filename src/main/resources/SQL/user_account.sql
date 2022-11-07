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






