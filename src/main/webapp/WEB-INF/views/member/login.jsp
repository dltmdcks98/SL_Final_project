<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="../include/static-head.jsp" %>
    <link rel="stylesheet" href="/css/board/board_list.css">
</head>
<style>

.aaa{
    padding-left: 5%;
    border: none;
    background: white;

}


</style>
<body>
<%@include file="../include/header.jsp" %>

<%--<section class="login first grey">--%>
    <div class="container">
        <div class="box-wrapper">
            <div class="box box-border">
                <div class="box-body">

                    <h4>Login</h4>

                    <form method="POST" action="/admin/login" name="myForm">
                        <div class="form-group">
                            <label>이메일</label>
                            <input type="text" name="user_email" class="form-control">
                        </div>

                        <div class="form-group">
                            <label>비밀번호</label>

                            <a href="forgot.html" class="pull-right">비밀번호를 잊으셨나요?</a>
                            </label>
                            <input type="password" name="user_pass" class="form-control">
                        </div>
                        <div class="form-group text-right">
                            <button name="button" class="btn btn-block btn-primary text-light">로그인</button>

                        </div>
                        <div class="form-group text-center">
                            <span class="text-muted">계정이 없으신가요?</span> <a href="register">회원가입</a>
                        </div>
                        <div class="title-line">
                            or
                        </div>
                    </form>
                    <button  class = "aaa" onclick="location.href='https://kauth.kakao.com/oauth/authorize?client_id=eac6586e062e9e84f8798226d9ac9be8&redirect_uri=http://13.113.19.114/login/kakao&response_type=code'" type="button" id="img_btn">
                        <img src="/img/kakao_login_medium_wide.jpg">
                    </button>
                </div>
            </div>
        </div>
    </div>
<%--</section>--%>

<!-- Start footer -->
<%@include file="../include/footer.jsp" %>
<!-- End Footer -->

<!-- JS -->
<script>
    document.myForm.addEventListener("keydown", evt => {
        if ((evt.keyCode || evt.which) === 13) {
            evt.preventDefault();
        }
    });
</script>


</body>
</html>