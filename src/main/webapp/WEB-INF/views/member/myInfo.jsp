<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
    .info-menu:first-child {
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
                <p class="menu-title">기본 정보 변경</p>
            </div>


            <c:if test = "${not fn:contains(user.user_name,'kakao')}">
            <form id = "update-form" action="/update" method="post">

                <div class="form-group">
                    <input type="hidden" name="user_id" class="form-control" value="${a.user_id}" readonly>
                </div>

                <div class="form-group">
                    <label>닉네임</label>
                    <input type="text" name="user_name" class="form-control"  placeholder="닉네임">
                </div>



                <div class="form-group">
                    <label class="fw">비밀번호</label>
                    <input type="password" name="user_pass" class="form-control">
                </div>

                <div class="form-group">
                    <label>생년월일</label>
                    <input type="date" name="user_birth" class="form-control">
                </div>

                <div class="form-group">
                    <label>성별</label><br>
                    <input type="radio" name="user_sex" value="m" > 남성
                    <input type="radio" name="user_sex"value="f"> 여성
                </div>
                <div class="form-group text-right">
                    <button type="submit" class="btn btn-primary btn-block" id="regist-btn">변경</button>
                </div>

            </form>
            </c:if>
<c:if test = "${fn:contains(user.user_name,'kakao')}">
            <form id = "update-form" action="/update-kakao" method="post">
                <div class="form-group">
                    <input type="hidden" name="user_id" class="form-control" value="${user.user_id}" readonly>
                </div>

                <div class="form-group">
                    <label>닉네임</label>
                    <input type="text" name="user_name" class="form-control"  placeholder="닉네임">
                </div>

                <div class="form-group text-right">
                    <button type="submit" class="btn btn-primary btn-block" id="regist-btn">변경</button>
                </div>

            </form>
</c:if>

        </div>

    </div>


</div>
</section>
<%@include file="../include/footer.jsp" %>
</body>


</html>
