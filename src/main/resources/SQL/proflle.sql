CREATE TABLE profile(
    file_no INT(10) AUTO_INCREMENT PRIMARY KEY ,
    user_id INT(10) NOT NULL,
    file_name VARCHAR(150) NULL,
    CONSTRAINT fk_profile FOREIGN KEY (user_id) REFERENCES user_account (user_id) ON DELETE CASCADE

);

SELECT * FROM profile;