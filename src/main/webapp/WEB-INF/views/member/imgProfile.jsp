<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <%@ include file="../include/static-head.jsp" %>
    <link rel="stylesheet" href="/css/mypage/profile.css">

</head>

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