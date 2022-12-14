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


                <c:if test="${not fn:contains(user.user_sex,'k')}">
                    <form id="update-form" action="/update" method="post" enctype="multipart/form-data" onsubmit="return check()">

                        <div class="form-group">
                            <input type="hidden" name="user_id" class="form-control" value="${user.user_id}" readonly>
                        </div>

                        <div class="form-group">
                            <label>닉네임</label>
                            <input type="text" id="user_name" name="user_name" class="form-control"
                                   placeholder="현재 닉네임 : ${user.user_name}">
                        </div>

                        <div class="form-group">
                            <label class="fw">비밀번호</label>
                            <input type="password" id="user_pass" name="user_pass" class="form-control">
                        </div>

                        <div class="form-group">
                            <div class="insertFile circle">
                                <figure class="featured-author-picture">
                                    <c:forEach var="a" items="${findProfile}">
                                        <img src="/loadFile?fileName=${a.fileName}" alt="profile">
                                    </c:forEach>
                                </figure>
                            </div>
                            <div class="fileDrop" style="height: 50px;" >
                                <a href="imgProfile"><span>프로필 사진 등록</span></a>
                            </div>

                            <div class="form-group text-right">
                                <button type="submit" class="btn btn-primary btn-block" id="regist-btn">변경</button>
                            </div>
                        </div>
                    </form>
                </c:if>

                <c:if test="${fn:contains(user.user_sex,'k')}">
                    <form id="update-form" action="/update-kakao" method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <input type="hidden" name="user_id" class="form-control" value="${user.user_id}" readonly>
                        </div>

                        <div class="form-group">
                            <label>닉네임</label>
                            <input type="text" name="user_name" class="form-control"
                                   placeholder="현재 닉네임 : ${user.user_name}">
                        </div>

                        <div class="form-group">
                            <div class="form-group text-right">
                                <button type="submit" class="btn btn-primary btn-block" id="regist-btn2">변경</button>
                            </div>
                        </div>
                    </form>
                </c:if>
            </div>

        </div>


    </div>
</section>

<%@include file="../include/footer.jsp" %>
</body>
<script>
    function check() {
        var userName = document.getElementById("user_name");
        var userPass = document.getElementById("user_pass");

        if (userName.value == "") {
            alert("닉네임을 입력하세요");
            userName.focus();
            return false;
        }
        if (userName.value.length > 10) {
            alert("닉네임을 10글자 이하로 입력하세요");
            userName.focus();
            return false;
        }
        if (userPass.value == "") {
            alert("비밀번호를 입력하세요");
            userPass.focus();
            return false;
        }

    }
</script>

</html>
