<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <%@ include file="../include/static-head.jsp" %>

    <link rel="stylesheet" href="/css/board/board_content.css">
</head>
<body>
<%@ include file="../include/header.jsp" %>
<br><br><br><br><br><br><br><br><br><br><br><br><br>
<div class="wrap">
    <div class="content-container">

        <h1 class="main-title">자유 게시판</h1>

        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">작성자</label>
            <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="${a.user_name}"
                   name="writer"
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
</div>
<!-- 게시글 영역 end -->

<!-- 댓글 영역 -->
<div id="replies" class="row">
    <div class="offset-md-1 col-md-10">
        <!-- 댓글 쓰기 영역 -->
        <div class="card">
            <div class="card-body">
                <%--${loginUser == null}과 같음  }--%>
                <c:if test="${empty user}">
                    <a href="/login">댓글은 로그인 후 작성 가능합니다.</a>
                </c:if>

                <c:if test="${not empty user}">
                    <div class="row">
                        <div class="col-md-9">
                            <div class="form-group">
                                <label for="newReplyText" hidden>댓글 내용</label>
                                <textarea rows="3" id="newReplyText" name="replyText" class="form-control"
                                          placeholder="댓글을 입력해주세요."></textarea>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="newReplyWriter" hidden>댓글 작성자</label>
                                <input id="newReplyWriter" name="replyWriter" type="text"
                                       value="${user.user_name}" class="form-control" placeholder="작성자 이름"
                                       readonly style="margin-bottom: 6px;">
                                <button id="replyAddBtn" type="button"
                                        class="btn btn-dark form-control">등록
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
v>

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
</div>
<%@include file="../include/reply.jsp"%>

</body>


</html>
