<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <%@ include file="../include/static-head.jsp" %>
    <link rel="stylesheet" href="/css/board/board_content.css">
    <link rel="stylesheet" href="/css/board/Reply.css">

</head>
<body>
<%@ include file="../include/header.jsp" %>

        <h1 class="main-title">자유 게시판</h1>

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

                <!-- 댓글 페이징 영역 -->
                <ul class="pagination justify-content-center">
                    <!--
                    < JS로 댓글 페이징 DIV삽입 >
                -->
                </ul>
            </div>
        </div> <!-- end reply content -->
    </div>
</div> <!-- end replies row -->

<!-- 댓글 수정 모달 -->
<div class="modal fade bd-example-modal-lg" id="replyModifyModal">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header" style="background: #343A40; color: white;">
                <h4 class="modal-title">댓글 수정하기</h4>
                <button type="button" class="close text-white" data-bs-dismiss="modal">X</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <div class="form-group">
                    <input id="modReplyId" type="hidden">
                    <label for="modReplyText" hidden>댓글내용</label>
                    <textarea id="modReplyText" class="form-control" placeholder="수정할 댓글 내용을 입력하세요."
                              rows="3"></textarea>
                </div>
            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
                <button id="replyModBtn" type="button" class="btn btn-dark">수정</button>
                <button id="modal-close" type="button" class="btn btn-danger"
                        data-bs-dismiss="modal">닫기
                </button>
            </div>
        </div>
    </div>
</div>


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
<%@include file="../include/reply.jsp"%>>

</html>

