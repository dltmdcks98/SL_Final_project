<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="../include/static-head.jsp" %>
    <link rel="stylesheet" href="/css/board/board_write.css">
    <link rel="stylesheet" href="/css/board/board_edit.css">
<%--    <script src="/js/board/write.js" defer></script>--%>
    <script src="/js/board/jquery_board_edit.js" defer></script>
    <script src="/js/board/tag.js" defer></script>
    <style>
        .uploaded-list {
            display: flex;
            width: 100%;
            height: 150px;
        }
        .img-sizing {
            background-repeat: no-repeat;
            background-position: center;
            display: block;
            width: 20%;
            height: 100%;
            overflow: hidden;
        }
    </style>
</head>
<body>
<%@ include file="../include/header.jsp" %>

<div class="wrap">
    <!-- 게시글 영역 begin -->
    <div class="write-container">
        <form id="edit-form" action="/board/edit?boardNo=${board.boardNo}" method="post" class="myForm" autocomplete="off" enctype="multipart/form-data">


            <div class="mb-4">
                <input type="hidden" class="form-control" id="asd" placeholder="${a.user_id}" name="user_id"
                       disabled>
                <input type="hidden" class="form-control" id="boardNo" value="${board.boardNo}" name="boardNo"
                       disabled>
            </div>


            <div class="mb-4">
                <label for="exampleFormControlInput1" class="form-label">작성자</label>
                <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="${a.user_name}"
                       name="writer"
                       value="${a.user_name}" disabled>

            </div>
            <div class="mb-4">
                <label for="title-input" class="form-label">글제목</label>
                <input type="text" class="form-control" id="title-input" value="${board.title}" name="title">
            </div>
            <div class="mb-4">
                <label for="exampleFormControlTextarea1" class="form-label">내용</label>
                <textarea name="content" class="form-control" id="exampleFormControlTextarea1"
                          rows="20">${board.content}</textarea>
            </div>

            <!-- 첨부파일 드래그 앤 드롭 영역 -->
            <div class="form-group">
                <div class="fileDrop">
                    <span>Drop Image</span>
                </div>
                <div class="uploadDiv">
                    <input type="file" name="files" id="ajax-file">
                </div>
                <div class="fileDiv">
                    <!-- 업로드된 파일의 썸네일을 보여줄 영역 -->
                    <div class="uploaded-list">

                    </div>
                    <span>이미지 클릭시 삭제됩니다</span>
                </div>
            </div>
            <div class="tagDivStart">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-tag"
                     viewBox="0 0 16 16">
                    <path d="M6 4.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm-1 0a.5.5 0 1 0-1 0 .5.5 0 0 0 1 0z"/>
                    <path d="M2 1h4.586a1 1 0 0 1 .707.293l7 7a1 1 0 0 1 0 1.414l-4.586 4.586a1 1 0 0 1-1.414 0l-7-7A1 1 0 0 1 1 6.586V2a1 1 0 0 1 1-1zm0 5.586 7 7L13.586 9l-7-7H2v4.586z"/>
                </svg>
                <label for="tag" class="tagLabel">Tag</label>
            </div>
            <div class="tagDiv" id="tag">
                <div class="tagDivInput tagInput">
                    <c:forEach var="tag" items="${board.tagList}">
                        <input type="text" value="<c:out value="${tag}"></c:out>"/>
                    </c:forEach>
                </div>
            </div>

            <div class="comments-list">
                <button id="list-btn" type="button">돌아가기</button>
                <button id="edit-btn" type="button">수정하기</button>
            </div>
        </form>

    </div>
</div>
<!-- 게시글 영역 end -->

<script>
    const bno = '${board.boardNo}'; // bno = boardNo와 같다!
    const $listBtn = document.getElementById('list-btn');
    //목록버튼
    $listBtn.onclick = e => {
        if($listBtn) {
            location.href = '/board/content/${board.boardNo}';
        }
    };

    const $editBtn = document.getElementById('edit-btn');
    $editBtn.onclick = e => {
        const $form = document.getElementById('edit-form');
        $form.submit();
    };

</script>

<%@ include file="../include/footer.jsp" %>
</body>
</html>

