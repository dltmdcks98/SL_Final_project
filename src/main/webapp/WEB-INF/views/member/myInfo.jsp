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

            <form class="menu-content">
                <div class="simple-info">
                    <p class="menu-title">기본 정보 변경</p>
                </div>


                <c:if test="${not fn:contains(user.user_sex,'k')}">
                    <form id="update-form" action="/update" method="post" onsubmit="return check()">

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

                        <label for="fileDrop" class="profileLabel">
                            프로필 설정
                        </label>
                        <div class="profileContain">
                            <c:if test="${not empty profile}">
                                <div class="img-sizing beforeProfile">
                                    <img src="/loadFile?fileName=${profile}" alt="profile">
                                </div>
                            </c:if>
                            <c:if test="${empty profile}">
                                <div class="img-sizing beforeProfile">
                                    <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                                        <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                                        <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
                                    </svg>
                                </div>
                            </c:if>

                            <div class="fileDrop" id="fileDrop">
                                <span class="profileLabel">프로필로 설정할 이미지를 넣어주세요</span>
                            </div>

                            <div class="uploadDiv">
                                <input type="file" name="files" id="profile-file" accept=".jpg,.png">
                            </div>
                        </div>

                        <div class="form-group text-right">
                            <button type="submit" class="btn btn-primary btn-block" id="regist-btn1">변경</button>
                        </div>

                    </form>

                </c:if>

                <c:if test="${fn:contains(user.user_sex,'k')}">
                    <form id="update-form" action="/update-kakao" method="post" >
                        <div class="form-group">
                            <input type="hidden" name="user_id" class="form-control" value="${user.user_id}" readonly>
                        </div>

                        <div class="form-group">
                            <label>닉네임</label>
                            <input type="text" name="user_name" class="form-control"
                                   placeholder="현재 닉네임 : ${user.user_name}">
                        </div>

                        <label for="fileDrop" class="profileLabel">
                            프로필 설정
                        </label>

                        <div class="profileContain">
                            <c:if test="${not empty profile}">
                                <div class="img-sizing beforeProfile">
                                    <img src="/loadFile?fileName=${profile}" alt="profile">
                                </div>
                            </c:if>
                            <c:if test="${empty profile}">
                                <div class="img-sizing beforeProfile">
                                    <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                                        <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                                        <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
                                    </svg>
                                </div>
                            </c:if>

                            <div class="fileDrop" id="fileDrop">
                                <span class="profileLabel">프로필로 설정할 이미지를 넣어주세요</span>
                            </div>

                            <div class="uploadDiv">
                                <input type="file" name="files" id="profile-file" accept=".jpg,.png">
                            </div>
                        </div>

                        <div class="form-group text-right">
                            <button type="submit" class="btn btn-primary btn-block" id="regist-btn1">변경</button>
                        </div>

                    </form>
                </c:if>
            </div>

        </div>


    </div>
</section>
<%@include file="include/profile.jsp" %>
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
