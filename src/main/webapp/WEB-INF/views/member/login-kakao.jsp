
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="POST" action="/admin/login-kakao" name="myForm">
    <div class="form-group">
        <label>이메일</label>
        <input type="text" name="user_email" class="form-control" value="${k.user_email}">
    </div>

    <div class="form-group">
        <label>비밀번호</label>

        <a href="forgot.html" class="pull-right">비밀번호를 잊으셨나요?</a>
        </label>
        <input type="password" name="user_pass" class="form-control" value="${k.user_pass}">
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
</body>
</html>
