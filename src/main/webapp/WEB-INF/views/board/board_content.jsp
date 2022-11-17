<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <%@ include file="../include/static-head.jsp" %>
    <link rel="stylesheet" href="/css/board/board_content.css">


</head>
<body>
<%@ include file="../include/header.jsp" %>


<!-- 게시글 영역 begin -->
<div class="content">
    <label>
        <input type="hidden" name="boardNo" value="${b.boardNo}"> <!--hidden으로 숨길예정 test용-->
    </label>

    <div id="content-header">
        <input type="text" name="title" value="${b.title}" disabled >
        <input type="text" name="writer" value="${a.user_name}" disabled>
    </div>

    <div id="content-body">
         <textarea name="content" placeholder="내용작성" style="height:200px">${b.content}</textarea>
    </div>



    <div class="comments-list">
        <button id="list-btn" type="button">목록</button>
        <button id="edit-btn" type="button">수정</button>
        <button id="del-btn" type="button" >삭제</button>
    </div>

</div>
<!-- 게시글 영역 end -->



<%@ include file="../include/footer.jsp" %>
<%@ include file="../include/scripts.jsp" %>
<script>
    const $listBtn = document.getElementById('list-btn');
    const $editBtn = document.getElementById('edit-btn');
    const $delBtn = document.getElementById('del-btn');

    // console.log($listBtn);

    //목록버튼
    $listBtn.onclick = e => {

        location.href = '/board?pageNum=${p.pageNum}&amount=${p.amount}';
    };

    //수정버튼
    $editBtn.onclick = e => {
        if($editBtn!==null) {
            confirm('수정하시겠습니까?');
            location.href='/board/edit?boardNo=${b.boardNo}';
        }
    };

    //삭제버튼
    $delBtn.onclick = e => {
        if($delBtn!==null) {
            confirm('삭제하시겠습니까?');
            location.href='/board/delete?boardNo=${b.boardNo}';
        }
    };
</script>
</body>
</html>

