<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <%@ include file="../include/static-head.jsp" %>
    <link rel="stylesheet" href="/css/board/board_list.css">
    <link rel="stylesheet" href="/css/mypage/mypage.css">
    <link rel="stylesheet" href="/css/mypage/tag_mypage.css">
</head>
<style>
    .myinfo {
        background-color: #3b4890;
        color: white;
    }
    .info-menu:nth-child(2) {
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
                <p class="menu-title">관심사 설정</p>
            </div>
                <div class="tag-contain">
                    <label>현재 등록된 관심사 </label>
                    <div class="registed-tag tag-group">

                    </div>

                <label>인기 있는 관심사</label>
                    <div class="popular-tag tag-group">

                    </div>
                </div>

                <div class="input-tag-contain">
                    <div class="input-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bookmark-heart" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M8 4.41c1.387-1.425 4.854 1.07 0 4.277C3.146 5.48 6.613 2.986 8 4.412z"/>
                            <path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z"/>
                        </svg>
                    </div>
                    <input type="text" class="input-tag" placeholder="등록할 관심사를 입력해주세요">
                </div>

           <%--     <div class="form-group text-right">
                    <button class="btn btn-primary btn-block" id="regist-btn">변경</button>
                </div>--%>


        </div>

    </div>


</div>
    </section>
<%@include file="../include/footer.jsp" %>
<%@include file="include/mypageTag.jsp" %>
</body>


</html>
