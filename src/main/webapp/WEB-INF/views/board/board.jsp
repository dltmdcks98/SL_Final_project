<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="../include/static-head.jsp" %>
    <link rel="stylesheet" href="/css/board/board_list.css">
    <script src="/js/board/list.js"></script>
</head>

<body class="skin-orange">
<%@ include file="../include/header.jsp" %>

<section class="home">
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-sm-12 col-xs-12">



                <div class="line">

                    <div><a href="/">CommuRest</a></div>

                </div>


                <div class="row">

                    <div class="row">
                        <div class="tableWrapper">
                            <table class="tableList">
                                <thead class="thead">
                                <tr>
                                    <th>번호</th>
                                    <th>글쓴이</th>
                                    <th>제목</th>
                                    <th>작성일</th>
                                    <th>조회</th>
                                    <th>추천</th>
                                </tr>
                                </thead>

                                <tbody>
                                <c:forEach var="b" items="${bList}">
                                    <tr onclick="location.href='/board/content/${b.boardNo}?pageNum=${p.pageNum}&amount=${p.amount}'" >
                                        <td>${b.boardNo}</td>
                                        <td>${b.userName}</td>
                                        <td class="title">${b.title} <c:if test="${b.replyCnt != 0}">[${b.replyCnt}]</c:if>
                                        </td>
                                        <td>${b.simpleDate}</td>
                                        <td>${b.hit}</td>
                                        <td>${b.recommend}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div>
                        <nav class="page">
                            <ul class="pagination pagination-lg pagination-custom">

                                <c:if test="${pageMaker.prev}">
                                    <li class="page-item"><a class="page-link" href="/board?pageNum=${pageMaker.beginPage - 1}&amount=${pageMaker.page.amount}">◀</a></li>
                                </c:if>


                                <c:forEach var="n" begin="${pageMaker.beginPage}" end="${pageMaker.endPage}" step="1">
                                    <li data-page-num="${n}" class="page-item">
                                        <a class="page-link" href="/board?pageNum=${n}&amount=${pageMaker.page.amount}">${n}</a>
                                    </li>
                                </c:forEach>

                                <c:if test="${pageMaker.next}">
                                    <li class="page-item"><a class="page-link" href="/board?pageNum=${pageMaker.endPage + 1}&amount=${pageMaker.page.amount}">▶</a></li>
                                </c:if>


                            </ul>
                        </nav>
                        <div class="btn-write">
                            <a href="board/write">글쓰기</a>
                        </div>
                    </div>
                    <!-- 글쓰기 버튼 -->

                    <div class="search">
                        <form action="/board" method="get">


                            <select class="form-select" name="type" id="search-type">
                                <option value="title">제목</option>
                                <option value="content">내용</option>
                                <option value="writer">작성자</option>
                                <option value="tc">제목+내용</option>
                            </select>
                            <input type="text" class="form-controller" name="" value="">

                            <button class="btn btn-primary" type="submit">
                                <i class="fas fa-search"></i>
                            </button>
                        </form>

                    </div>
                </div>






            </div>


        </div>
    </div>
</section>



<%@ include file="../include/footer.jsp"%>

</body>
</html>