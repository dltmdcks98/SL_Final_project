<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <%@ include file="../include/static-head.jsp" %>
    <link rel="stylesheet" href="/css/board/board_list.css">
</head>
<style>

    .mymain-container {

        margin-top: 12%;
        height: 100%;
        margin-left: 10%;
        margin-right: 10%;
    }

    .right-container {
        float: left;
        width: 80%;
        height: 80%;


    }

    .left-container {
        float: left;
        width: 20%;

    }

    .left-menu li {
        border: 1px #BDBDBD solid;
        border-radius: 5%;
        margin-right: 15%;
        text-align: left;
        padding-left: 5%;
        margin-top: 5%;
        padding-top: 4%;
        padding-bottom: 4%;
        font-weight: bold;

    }

    .myinfo {
        background-color: #3b4890;
        color: white;
    }

    .tableList td {
        padding-bottom: 2px;
        text-align: left;
    }

    .tableList p {
        font-size: 6px;
    }

    .home-title {
        font-size: 20px;
        font-weight: bold;

        border-top: hidden;
        border-left: hidden;
        border-right: hidden;
        border-bottom: 2px #3b4890 solid;

        color: #FA5858;


    }


    .row:nth-child(2) {
        margin-top: 2%;
    }

    .info-menu {
        float: left;
        border: 1px #BDBDBD solid;
        border-radius: 10px;
        padding: 3%;

        text-align: center;
        font-weight: bold;
        width: 20%;
        margin: auto 4%;


    }

    .info-menu:nth-child(2) {
        background-color: #3b4890;
        color: white;

    }

    .info-menu-container {

    }

    .menu-content {
        float: left;

        width: 80%;
        height: 80%;
    }

    .menu-title {
        margin-top: 5%;
        padding-bottom: 1%;
        font-size: 17px;
        font-weight: bold;

        border-top: hidden;
        border-left: hidden;
        border-right: hidden;
        border-bottom: 2px #3b4890 solid;

        color: #FA5858;
    }

</style>

<body>
<%@include file="../include/header.jsp" %>

<div class="mymain-container">


    <div class="left-container">

        <ul class="left-menu">
            <li class="home" onclick="location.href='/mypage'">홈</li>
            <li class="posting" onclick="location.href='/mypage/myposting'">게시글</li>
            <li class="comment" onclick="location.href='/mypage/mycomment'">댓글</li>
            <li class="myinfo" onclick="location.href='/mypage/myinfo'">개인 정보 관리</li>

        </ul>


    </div>

    <div class="right-container">
        <div class="info-menu-container">
            <div class="info-menu" onclick="location.href='/mypage/myinfo'"> 기본 정보 변경</div>
            <div class="info-menu" onclick="location.href='/mypage/myinfo_tag'"> 관심사 설정</div>
            <div class="info-menu" onclick="location.href='/mypage/myinfo_drop'"> 회원 탈퇴</div>
        </div>

        <div class="menu-content">
            <div class="simple-info">
                <p class="menu-title">관심사 설정</p>
            </div>
            <form id = "tag-form" action="/admin/tag" method="post">


                <div class="form-group">
                    <label>관심사</label>
                    <input type="text" name="user_email" class="form-control">
                </div>

                <div class="form-group text-right">
                    <button class="btn btn-primary btn-block" id="regist-btn">변경</button>
                </div>

            </form>
        </div>

    </div>


</div>

<%@include file="../include/footer.jsp" %>
</body>


</html>
