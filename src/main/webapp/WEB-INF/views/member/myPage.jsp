<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <%@ include file="../include/static-head.jsp" %>
    <link rel="stylesheet" href="/css/board/myPage_boardList.css">
    <link rel="stylesheet" href="/css/mypage/mypage.css">

</head>
<style>
    .home {
        background-color: #F73F52;
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
                            <c:forEach var="b" items="${bList}" begin="0" end="4" step="1">
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
                            <c:forEach var="r" items="${rList}" begin="0" end="4" step="1">
                                <tr onclick="location.href='/board/content/${r.boardNo}'">
                                    <td class="title">${r.replyText}
                                        <p>${r.replyDate}</p>
                                    </td>
                                </tr>
                            </c:forEach>

                        </table>
                    </div>

                </div>

            </div>

        </div>
    </div>
</section>

<%@include file="../include/footer.jsp" %>


</body>
</html>
