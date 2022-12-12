CREATE TABLE profile(
    file_name VARCHAR(150) PRIMARY KEY,
    user_id INT(10) NOT NULL
);

SELECT * FROM profile;
delete  from profile where user_id=20;
drop table profile;

SELECT DISTINCT A.user_id, B.user_id, B.file_name
FROM user_account A
         JOIN finaldb.profile B ON A.user_id = B.user_id