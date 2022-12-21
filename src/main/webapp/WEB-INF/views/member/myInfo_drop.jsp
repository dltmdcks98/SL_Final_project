<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <%@ include file="../include/static-head.jsp" %>
    <link rel="stylesheet" href="/css/board/myPage_boardList.css">
    <link rel="stylesheet" href="/css/mypage/mypage.css">
</head>
<style>
    .myinfo {
        background-color: #3b4890;
        color: white;
    }

    .info-menu:nth-child(3) {
        background-color: #3b4890;
        color: white;
    }
</style>

<body>
<%@include file="../include/header.jsp" %>
<section>
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
                <p class="menu-title">회원 탈퇴</p>
            </div>


            <form id = "delete-form" action="/userDelete" method="post">
                <div class="form-group">
                    <input type="hidden" name="user_id" class="form-control" value="${a.user_id}" readonly>
                </div>
너없으면 망함 탈퇴 ㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴ
너없으면 망함 탈퇴 ㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴ
너없으면 망함 탈퇴 ㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴ
너없으면 망함 탈퇴 ㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴ
너없으면 망함 탈퇴 ㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴ
너없으면 망함 탈퇴 ㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴ
너없으면 망함 탈퇴 ㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴ
너없으면 망함 탈퇴 ㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴ
너없으면 망함 탈퇴 ㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴ
너없으면 망함 탈퇴 ㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴ
너없으면 망함 탈퇴 ㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴ
너없으면 망함 탈퇴 ㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴ
너없으면 망함 탈퇴 ㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴ
너없으면 망함 탈퇴 ㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴ

                <div class="form-group text-right">
                    <button class="btn btn-primary btn-block" id="regist-btn">탈퇴</button>
                </div>

            </form>
        </div>

    </div>


</div>
    </section>

<%@include file="../include/footer.jsp" %>
</body>


</html>
