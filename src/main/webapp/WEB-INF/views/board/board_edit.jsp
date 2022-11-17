<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <%@ include file="../include/static-head.jsp" %>
    <link rel="stylesheet" href="/css/board/edit.css">


</head>
<body>
<%@ include file="../include/header.jsp" %>


<!-- 게시글 영역 begin -->
<div class="content">
    <form action="/board/edit" method="post">

        <input type="hidden" name="boardNo" value="${board.boardNo}"> <!--hidden으로 숨길예정 test용-->
        <input type="hidden" name="userId" value="${board.userId}" >

        <div class="content-header">
            <input type="text" name="title" value="${board.title}" >
        </div>

        <div class="content-body">
            <textarea name="content" style="height:200px">${board.content}</textarea>
        </div>

        <div class="comments-list">
            <button id="edit-btn" type="submit">수정하기</button>
            <button id="list-btn" type="button">돌아가기</button>
        </div>
    </form>

</div>
<!-- 게시글 영역 end -->



<%@ include file="../include/footer.jsp" %>
<%@ include file="../include/scripts.jsp" %>

<script>
    const $listBtn = document.getElementById('list-btn');
    //목록버튼
    $listBtn.onclick = e => {
        location.href = '/board/content/${board.boardNo}';
    };
</script>
</body>
</html>

