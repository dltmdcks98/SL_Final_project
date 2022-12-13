<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="../include/static-head.jsp" %>
    <link rel="stylesheet" href="/css/board/board_list.css">
    <link rel="stylesheet" href="/css/board/index.css">
    <script src="/js/board/list.js" defer></script>
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
                                    <th>제목</th>
                                    <th>글쓴이</th>
                                    <th>작성일</th>
                                    <th>조회</th>
                                    <th>추천</th>
                                </tr>
                                </thead>

                                    <tbody>
                                    <c:forEach var="b" items="${bList}">
                                        <tr onclick="location.href='/board/content/${b.boardNo}?pageNum=${s.pageNum}&amount=${s.amount}'" >
                                            <td>${b.boardNo}</td>
                                            <td class="title">${b.title} <c:if test="${b.replyCnt != 0}">[${b.replyCnt}]</c:if>
                                                <c:if test="${b.newBoard}">
                                                    <span class="badge badge-secondary">New</span>
                                                </c:if>
                                            </td>
                                            <td>${b.userName}</td>
                                            <td>${b.simpleDate}</td>
                                            <td>${b.hit}</td>
                                            <td>${b.recommend}</td>
                                            <c:if test="${b.myRecommend}">
                                                <td>
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="currentColor" class="bi bi-bookmark-heart" viewBox="0 0 16 16">
                                                        <path fill-rule="evenodd" d="M8 4.41c1.387-1.425 4.854 1.07 0 4.277C3.146 5.48 6.613 2.986 8 4.412z"/>
                                                        <path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z"/>
                                                    </svg>
                                                </td>
                                            </c:if>

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
                                        <li class="page-item"><a class="page-link" href="/board?pageNum=${pageMaker.beginPage - 1}&amount=${pageMaker.page.amount}&type=${s.type}&keyword=${s.keyword}">◀</a></li>
                                    </c:if>


                                    <c:forEach var="n" begin="${pageMaker.beginPage}" end="${pageMaker.endPage}" step="1">
                                        <li data-page-num="${n}" class="page-item">
                                            <a class="page-link" href="/board?pageNum=${n}&amount=${pageMaker.page.amount}&type=${s.type}&keyword=${s.keyword}">${n}</a>
                                        </li>
                                    </c:forEach>

                                    <c:if test="${pageMaker.next}">
                                        <li class="page-item"><a class="page-link" href="/board?pageNum=${pageMaker.endPage + 1}&amount=${pageMaker.page.amount}&type=${s.type}&keyword=${s.keyword}">▶</a></li>
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
                                    <option value="userName">작성자</option>
                                    <option value="tagValue">태그</option>
                                    <option value="tc">제목+내용</option>
                                </select>
                                <input type="text" class="form-controller" name="keyword" value="${s.keyword}">

                                <button class="btn btn-primary" type="submit" value="조회">
                                    <i class="fas fa-search"></i>
                                </button>
                            </form>

                    </div>
                </div>






            </div>


            <%@include file="../include/sidebar.jsp"%>
        </div>
    </div>
</section>



<%@ include file="../include/footer.jsp"%>

</body>
</html>