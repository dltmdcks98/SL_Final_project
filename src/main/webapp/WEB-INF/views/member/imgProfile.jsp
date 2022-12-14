<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <%@ include file="../include/static-head.jsp" %>
    <link rel="stylesheet" href="/css/mypage/profile.css">

</head>
<style>
    body {
        font-family: 'Jeju Gothic', sans-serif;
    }
    .mymain-container {
        height: 60%;
        margin: 2% 23% 10% 23%;
    }
    .form-group {
        width: 100%;
        height: auto;
    }
    .fileDrop {
        text-align: center;
        height: 10%;
        width: 100%;
        border: 2px solid greenyellow;
    }
    .uploaded-list {
        width: 100%;
        height: 100%;
        vertical-align: middle;
    }
    .uploaded-list img, svg {
        width: 100%;
        height: auto;
        background-size: cover;
    }
    .uploadDiv {
        display: none;
    }
</style>
<body>
<%@include file="../include/header.jsp" %>
<section>
    <div class="mymain-container">
        <form id="profile-form" action="/mypage/imgProfile" method="post" enctype="multipart/form-data">

            <div class="form-group-none">
                <input type="hidden" name="user_id" class="form-control" value="${admin.user_id}" readonly>
            </div>

            <div class="form-group">
                <!-- 업로드된 파일의 썸네일을 보여줄 영역 -->
                <div class="uploaded-list" >

                </div>

                <div class="fileDrop">
                    <span>Image Drop!</span>
                </div>

                <div class="uploadDiv">
                    <input type="file" name="files" id="profile-file">
                </div>

                <%-- <div class="insertFile circle">--%>
                <%-- <img class="profile-pic" src="https://t3.ftcdn.net/jpg/03/46/83/96/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg">--%>
                <%-- </div>--%>
                <%-- <div class="uploadDiv">--%>
                <%--<input class="file-upload" type="file" accept="image/*" name="files" id="profile-upload"/>--%>
                <%--</div>--%>

                <div class="form-group text-right">
                    <button type="submit" class="btn btn-primary btn-block" id="regist-btn">변경</button>
                </div>
            </div>
        </form>
    </div>
</section>
<%@include file="include/profile.jsp" %>
<%@include file="../include/footer.jsp" %>
</body>


</html>