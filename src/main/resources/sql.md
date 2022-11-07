사용자 계정
1. user_id Pk 
2. admin boolean default false
3. reg_date default
4. user_birth
5. user_name
6. user_pass 
7. user_email => 아이디입력칸에 잡는거 
8. user_sex


게시판
1. board_id pk
2. user_id(fk)
3. title
4. content (clob)
5. hit default 0
6. regdate default sysdate
7. like default 0
8. image_url 
9. tag_id

comment
1. comment_id(pk)
2. user_id
3. c_content
4. regdate
5. like default 0

TAG 
1. tag_id
2. tag_value



