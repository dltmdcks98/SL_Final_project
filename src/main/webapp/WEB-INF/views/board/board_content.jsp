<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="../include/static-head.jsp" %>
    <link rel="stylesheet" href="/css/board/board_content.css">
    <script src="/js/board/contentTag.js" defer></script>
</head>
<style>
    #hideSideBar {
        display: none;
    }

    @media (max-width: 768px) {
        .content {
            width: 90%;
        }

        .recommend {
            width: 90%;
        }

        .col-md-3 > .form-group {
            width: 100%;
        }

        #hideSideBar {
            display: inline-block;
        }
    }
</style>
<body>
<%@ include file="../include/header.jsp" %>

<section class="home">
    <!-- 게시글 영역 begin -->
    <label>
        <input type="hidden" name="boardNo" value="${b.boardNo}"> <!--hidden으로 숨길예정 test용-->
    </label>

    <div class="content">
        <p class="boardH">자유게시판</p>
        <div class="content-title-div">
            <p class="content-title">${b.title}</p>

        </div>
        <div class="justify">
            <div class="content-content"> ${a.user_name} </div>
            <div>${b.simpleDate}</div>
            <div>조회: ${b.hit} 추천: ${b.recommend}</div>
        </div>
        <HR>
        <%--        <input class = "content-writer" type="text" name="writer" value="${a.user_name}" disabled>--%>


        <div id="content-body" class="content-body">
            <textarea name="content" placeholder="내용작성" class="textArea" disabled>${b.content}</textarea>
        </div>
        <!-- 파일 업로드 영역 begin -->
        <div class="form-group file-div">
            <ul class="uploaded-list"></ul>
        </div>
        <!-- 파일 업로드 영역 end -->
        <div class="tagDiv" id="tag">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-tag"
                 viewBox="0 0 16 16">
                <path d="M6 4.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm-1 0a.5.5 0 1 0-1 0 .5.5 0 0 0 1 0z"/>
                <path d="M2 1h4.586a1 1 0 0 1 .707.293l7 7a1 1 0 0 1 0 1.414l-4.586 4.586a1 1 0 0 1-1.414 0l-7-7A1 1 0 0 1 1 6.586V2a1 1 0 0 1 1-1zm0 5.586 7 7L13.586 9l-7-7H2v4.586z"/>
            </svg>
            <label for="tag" class="tagLabel">Tag</label>
            <c:forEach var="tag" items="${b.tagList}">
                <a href="/gallery/search-tag?tag=${tag}">
                    <div class="tagList">#<c:out value="${tag}"/></div>
                </a>
            </c:forEach>
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

            <div class="comments-list">

                <button class="list-btn" id="list-btn" type="button">전체글</button>
                <c:if test="${user.manager=='ROLE_ADMIN' || user.user_id == b.userId}">
                    <button id="edit-btn" type="button">글수정</button>
                    <button id="del-btn" type="button">글삭제</button>
                </c:if>

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
                        <button id="modal-close" type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="hideSideBar">
        <%@include file="../include/sidebar.jsp" %>
    </div>
</section>


<%@ include file="../include/scripts.jsp" %>
<%@ include file="../include/reply.jsp" %>
<%@ include file="../include/footer.jsp" %>

<script src="/js/board/jquery_board_content.js"></script>
</body>


</html>
