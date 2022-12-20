CREATE TABLE profile(
    file_name VARCHAR(150) PRIMARY KEY,
    user_id INT(10) NOT NULL,
    CONSTRAINT fk_profile FOREIGN KEY (user_id) REFERENCES user_account (user_id) ON DELETE CASCADE
);

CREATE TABLE profile(
    file_no INT(10) AUTO_INCREMENT PRIMARY KEY ,
    user_id INT(10) NOT NULL,
    file_name VARCHAR(150) NULL,
    CONSTRAINT fk_profile FOREIGN KEY (user_id) REFERENCES user_account (user_id) ON DELETE CASCADE

);

SELECT A.user_id, B.user_id, B.file_name
FROM user_account A
         JOIN profile B ON A.user_id = B.user_id;
use finaldb;

SELECT * FROM profile;

delete from profile where user_id=20;
delete from profile where user_id=54;
drop table profile;

SELECT IF(COUNT(*) = 1, 1, 0) FROM profile where user_id=20;
SELECT COUNT(*) FROM profile where user_id=20;



