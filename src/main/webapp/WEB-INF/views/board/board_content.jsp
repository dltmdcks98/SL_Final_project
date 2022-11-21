<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <%@ include file="../include/static-head.jsp" %>
    <link rel="stylesheet" href="/css/board/board_content.css">

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
        <input type="text" name="title" value="${b.title}" disabled>
        <input type="text" name="writer" value="${a.user_name}" disabled>
    </div>

    <div id="content-body" class="content-body">
        <textarea name="content" placeholder="내용작성" class="area-text">${b.content}</textarea>
    </div>


    <div class="comments-list">
        <button id="list-btn" type="button">목록</button>
        <c:if test="${user.user_id == b.userId}">
            <button id="edit-btn" type="button">수정</button>
            <button id="del-btn" type="button">삭제</button>
        </c:if>

    </div>

</div>
<!-- 게시글 영역 end -->

<!-- 댓글 영역 -->
<div id="replies" class="row-content">
    <div class="recommend">
        <!-- 댓글 쓰기 영역 -->
        <div class="card">
            <div class="card-body">
                <c:if test="${empty user}">
                    <a href="/login">댓글은 로그인 후 작성 가능합니다.</a>
                </c:if>

                <c:if test="${not empty user}">
                    <div class="row">
                        <div class="write-recommend">
                            <div class="com">
                                <label for="newReplyText" hidden>댓글 내용</label>
                                <textarea rows="3" id="newReplyText" name="replyText" class="recommend-text"
                                          placeholder="댓글을 입력해주세요."></textarea>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="newReplyWriter" hidden>댓글 작성자</label>
                                <input id="newReplyWriter" name="replyWriter" type="text"
                                       value="${user.user_name}" class="form-control" placeholder="작성자 이름"
                                       readonly>
                                <button id="replyAddBtn" type="button" class="btn btn-dark form-control">
                                    등록
                                </button>
                            </div>
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
        <!-- end reply write -->

        <!--댓글 내용 영역-->
        <div class="card">
            <!-- 댓글 내용 헤더 -->
            <div class="card-header text-white m-0" style="background: #343A40;">
                <div class="float-left">댓글 (<span id="replyCnt">0</span>)</div>
            </div>

            <!-- 댓글 내용 바디 -->
            <div id="replyCollapse" class="card">
                <div id="replyData">
                    <!-- 댓글 페이징 영역 -->
                    <ul class="pagination justify-content-center">

                    </ul>
                </div>
            </div>
            <!-- end reply content -->
        </div>
    </div>
    <!-- end replies row -->

    <!-- 댓글 수정 모달 -->
    <div class="modal fade bs-example-modal-lg" id="replyModifyModal">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
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
                    <button id="modal-close" type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="../include/scripts.jsp"%>
<%@ include file="../include/reply.jsp"  %>
<%@ include file="../include/footer.jsp" %>
</body>

</html>
