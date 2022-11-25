<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <%@ include file="../include/static-head.jsp" %>
    <link rel="stylesheet" href="/css/board/board_list.css">
    <link rel="stylesheet" href="/css/mypage/mypage.css">
</head>
<style>
    .comment {
        background-color: #3b4890;
        color: white;
    }
</style>

<body>
<%@include file="../include/header.jsp" %>
<section>
    <div class="mymain-container">
        <div class="test">

            <div class="left-container">

                <ul class="left-menu">
                    <li class="home" onclick="location.href='/mypage'">홈</li>
                    <li class="posting" onclick="location.href='/mypage/myposting'">게시글</li>
                    <li class="comment" onclick="location.href='/mypage/mycomment'">댓글</li>
                    <li class="myinfo" onclick="location.href='/mypage/myinfo'">개인 정보 관리</li>

                </ul>


            </div>

            <div class="right-container">

                <div class="row">


                    <div class="tableWrapper">
                        <table class="tableList">
                            <tr>
                                <td class="home-title">댓글</td>
                                <td class="t1">
                                    <input type="text" name="q" class="mysearch" placeholder="댓글 검색">
                                    <button class="btn btn-primary"><i class="ion-search"></i></button>
                                </td>


                            </tr>
                            <c:forEach var="r" items="${rList}">
                                <tr onclick="location.href='/board/content/${r.boardNo}'">
                                    <td class="title">${r.replyText}
                                        <p>${r.replyDate}</p>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>

                </div>

                <div class="row">

                    <div>
                        <nav class="page">
                            <ul class="pagination pagination-lg pagination-custom">

                                <c:if test="${myBoardPageMaker.prev}">
                                    <li class="page-item"><a class="page-link" href="/mypage/mycomment?pageNum=${myBoardPageMaker.beginPage - 1}&amount=${myBoardPageMaker.page.amount}">◀</a>
                                    </li>
                                </c:if>


                                <c:forEach var="n" begin="${myBoardPageMaker.beginPage}" end="${myBoardPageMaker.endPage}" step="1">
                                    <li data-page-num="${n}" class="page-item">
                                        <a class="page-link" href="/mypage/mycomment?pageNum=${n}&amount=${myBoardPageMaker.page.amount}">${n}</a>
                                    </li>
                                </c:forEach>

                                <c:if test="${myBoardPageMaker.next}">
                                    <li class="page-item"><a class="page-link" href="/mypage/mycomment?pageNum=${myBoardPageMaker.endPage + 1}&amount=${myBoardPageMaker.page.amount}">▶</a>
                                    </li>
                                </c:if>


                            </ul>
                        </nav>

                    </div>

                </div>

            </div>

        </div>
    </div>
</section>
<%@include file="../include/footer.jsp" %>
<%@include file="./include/myPagePaging.jsp"%>
</body>


</html>
