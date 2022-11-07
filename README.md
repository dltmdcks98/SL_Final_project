SL Final Project
=========
<hr/>

## 주제 : Pinterest + 게시판
[Pintereset](https://www.pinterest.co.kr/)
### 시나리오  

#### 로그인
1. 첫 화면에 관심사들을 기반으로 검색한 이미지들 출력
2. TopBar(글로보기, 마이페이지(태그 편집), 로그아웃)
3. 글로 보기 클릭시 일반적인 게시판으로 전환(TopBar-> 자유게시판(등록일 순 나열+인기글나열),나의 관심사)
4. 글 상세 조회시 태그들을 개인 정보에 추가


#### 비로그인
1. 인기글들의 사진들을 출력
2. 향후 추가 기능 : 카테고리를 기반으로 글 사진 추천 및 검색

SQL
=====
<h3>
<details>
<summary>user_account</summary>
<div markdown="1">
 <table>
    <th>칼럼</th>
    <th>값</th>
    <tr>
        <td>user_id</td>
        <td>INT(10) AUTO_INCREMENT PrimaryKey</td>
    </tr>
    <tr>
        <td>manager</td>
        <td>VARCHAR(1) NOTNULL DEFAULT 'N'</td>
    </tr>
    <tr>
        <td>reg_date</td>
        <td>DATE DEFAULT current_timestamp</td>
    </tr>
    <tr>
        <td>user_birth</td>
        <td>DATE</td>
    </tr>
    <tr>
        <td>user_name</td>
        <td>VARCHAR(50) NOTNULL </td>
    </tr>
    <tr>
        <td>user_pass</td>
        <td>VARCHAR(150) NOTNULL</td>
    </tr>
    <tr>
        <td>user_email</td>
        <td>VARCHAR(100) NOTNULL</td>
    </tr>
    <tr>
        <td>user_sex</td>
        <td>VARCHAR(1) NOT NULL</td>
    </tr>
</table>
</div>
</details>
</h3>

<h3>
<details>
<summary>board</summary>
<div markdown="1">
 <table>
    <th>칼럼</th>
    <th>값</th>
    <tr>
        <td>board_id</td>
        <td>INT(10) AUTO_INCREMENT PRIMARY KEY </td>
    </tr>
    <tr>
        <td>user_id</td>
        <td>INT(10) NOT NULL FOREIGN KEY user_account (user_id)</td>
    </tr>
    <tr>
        <td>title</td>
        <td>VARCHAR(100) NOT NULL</td>
    </tr>
    <tr>
        <td>content</td>
        <td>TEXT</td>
    </tr>
    <tr>
        <td>hit</td>
        <td>INT(10) DEFAULT 0</td>
    </tr>
    <tr>
        <td>reg_date</td>
        <td>DATETIME DEFAULT current_timestamp</td>
    </tr>
    <tr>
        <td>recommend</td>
        <td>INT(10) DEFAULT 0</td>
    </tr>
    <tr>
        <td>image_url</td>
        <td>VARCHAR(200)</td>
    </tr>
    <tr>
        <td>tag_id</td>
        <td>VARCHAR(300)</td>
    </tr>
</table>
</div>
</details>
</h3>

<h3>
<details>
<summary>comment</summary>
<div markdown="1">
 <table>
    <th>칼럼</th>
    <th>값</th>
    <tr>
        <td>comment_id</td>
        <td>PrimaryKey INT(10) AUTO INCREMENT</td>
    </tr>
    <tr>
        <td>user_id</td>
        <td>INT(10) NOT NULL FOREIGN KEY user_account(user_id)</td>
    </tr>
    <tr>
        <td>c_content</td>
        <td>TEXT</td>
    </tr>
    <tr>
        <td>reg_date</td>
        <td>DATETIME DEFAULT current_timestamp</td>
    </tr>
    <tr>
        <td>recommend</td>
        <td>INT(10) DEFAULT 0</td>
    </tr>

</table>
</div>
</details>
</h3>

<h3>
<details>
<summary>tag</summary>
<div markdown="1">
 <table>
    <th>칼럼</th>
    <th>값</th>
    <tr>
        <td>tag_id</td>
        <td>INT(10) PRIMARY KEY</td>
    </tr>
    <tr>
        <td>tag_value</td>
        <td>VARCHAR(300)</td>
    </tr>
    <tr>
        <td>reg_date</td>
        <td>DATE DEFAULT current_timestamp</td>
    </tr>

</table>
</div>
</details>
</h3>

