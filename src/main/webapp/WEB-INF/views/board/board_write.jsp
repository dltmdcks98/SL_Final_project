<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../include/static-head.jsp" %>
    <link rel="stylesheet" href="/css/board/board_write.css">
    <script src="/js/board/board_write.js" defer></script>
    <script src="/js/board/jquery_board_write.js" defer></script>
</head>

<body>
<div class="wrap">
    <%@ include file="../include/header.jsp" %>

    <div class="write-container">

        <form id="write-form" action="/board/write" method="post" autocomplete="off" enctype="multipart/form-data">



            <div class="mb-4">
                <label for="writer-input" class="form-label">작성자</label>
                <input type="text" class="form-control" id="writer-input" placeholder="이름" name="user_name" >
            </div>
            <div class="mb-4">
                <label for="title-input" class="form-label">글제목</label>
                <input type="text" class="form-control" id="title-input" placeholder="제목" name="title">
            </div>
            <div class="mb-4">
                <label for="exampleFormControlTextarea1" class="form-label">내용</label>
                <textarea name="content" class="form-control" id="exampleFormControlTextarea1" rows="10"></textarea>
            </div>

            <!-- 첨부파일 드래그 앤 드롭 영역인데 일단은 필요없다고 해서 냅둠 -->
            <div class="form-group">
                <div class="fileDrop">
                    <span>Drop!</span>
                </div>
                <div class="uploadDiv">
                    <input type="file" name="files" id="ajax-file" style="display:none;">
                </div>
                <!-- 업로드된 파일의 썸네일을 보여줄 영역 -->
                <div class="uploaded-list">

                </div>
            </div>


            <div class="d-grid gap-2">
                <button id="write_btn" class="btn btn-dark" type="button">글 작성하기</button>
                <button id="list_btn" class="btn btn-info" type="button">목록으로</button>
            </div>

        </form>

    </div>

    <%@ include file="../include/footer.jsp" %>



</div>


<script>
    // 게시물 등록 입력값 검증 함수

</script>


</body>

</html>