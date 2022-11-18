<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <%@ include file="../include/static-head.jsp" %>
    <link rel="stylesheet" href="/css/board/board_list.css">
    <link rel="stylesheet" href="/css/mypage/mypage.css">

</head>
<style>
    .home {
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
                                <td class="home-title">게시글</td>
                            </tr>
                            <c:forEach var="b" items="${bList}">
                                <tr onclick="location.href='/board/content/${b.boardNo}'">
                                    <td class="title">${b.title} <c:if test="${b.replyCnt != 0}">[${b.replyCnt}]</c:if>
                                        <p>${b.simpleDate}</p>
                                    </td>
                                </tr>
                            </c:forEach>

                        </table>
                    </div>

                </div>

                <div class="row">


                    <div class="tableWrapper">
                        <table class="tableList">
                            <tr>
                                <td class="home-title">댓글</td>
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

                    <%--                    <div style="display: none">--%>
                    <%--                        <nav class="page">--%>
                    <%--                            <ul class="pagination pagination-lg pagination-custom">--%>

                    <%--                                <c:if test="${pageMaker.prev}">--%>
                    <%--                                    <li class="page-item"><a class="page-link" href="/board?pageNum=${pageMaker.beginPage - 1}&amount=${pageMaker.page.amount}">◀</a></li>--%>
                    <%--                                </c:if>--%>


                    <%--                                <c:forEach var="n" begin="${pageMaker.beginPage}" end="${pageMaker.endPage}" step="1">--%>
                    <%--                                    <li data-page-num="${n}" class="page-item">--%>
                    <%--                                        <a class="page-link" href="/board?pageNum=${n}&amount=${pageMaker.page.amount}">${n}</a>--%>
                    <%--                                    </li>--%>
                    <%--                                </c:forEach>--%>

                    <%--                                <c:if test="${pageMaker.next}">--%>
                    <%--                                    <li class="page-item"><a class="page-link" href="/board?pageNum=${pageMaker.endPage + 1}&amount=${pageMaker.page.amount}">▶</a></li>--%>
                    <%--                                </c:if>--%>


                    <%--                            </ul>--%>
                    <%--                        </nav>--%>
                    <%--                        --%>
                    <%--                        --%>
                    <%--                    </div>--%>
                    <%--                    --%>
                    <%--                    --%>

                </div>

            </div>

        </div>
    </div>
</section>
<%@include file="../include/footer.jsp" %>


</body>
<script>


</script>

</html>
