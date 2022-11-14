<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <%@ include file="../include/static-head.jsp" %>
</head>
<body>
    <%@ include file="../include/header.jsp" %>
<br><br><br><br><br><br><br><br><br><br><br><br><br>
    <div class="wrap">
        <div class="content-container">
            <br><br><br><br><br><br><br><br><br><br><br><br><br>
            <h1 class="main-title">${b.boardNo}번 게시물</h1>

            <div class="mb-3">
                <label for="exampleFormControlInput1" class="form-label">작성자</label>
                <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="이름" name="writer"
                       value="${a.user_name}" disabled>
            </div>
            <div class="mb-3">
                <label for="exampleFormControlInput2" class="form-label">글제목</label>
                <input type="text" class="form-control" id="exampleFormControlInput2" placeholder="제목" name="title"
                       value="${b.title}" disabled>
            </div>
            <div class="mb-3">
                <label class="form-label">내용</label>

                <p class="main-content">
                    ${b.content}

                </p>

            </div>





        </div>


        <%@ include file="../include/footer.jsp" %>
    </div>



</body>




</html>
