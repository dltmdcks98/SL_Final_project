CREATE TABLE profile(
    file_name VARCHAR(150) PRIMARY KEY,
    user_id INT(10) NOT NULL
);
use finaldb;
SELECT * FROM profile;
delete from profile where user_id=20;
drop table profile;

SELECT IF(COUNT(*) = 1, 1, 0) FROM profile where user_id=20;
SELECT COUNT(*) FROM profile where user_id=20;



