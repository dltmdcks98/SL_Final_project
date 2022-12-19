<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="./include/static-head.jsp" %>
    <link rel="stylesheet" href="/css/board/board_list.css">
    <link rel="stylesheet" href="/css/board/index.css">
    <link rel="stylesheet" href="/css/mobile.css">
</head>

<body>
    <%@ include file="./include/header.jsp"%>

    <!-- main begin -->

    <section>
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-sm-12 col-xs-12">



                    <div class="line">

                        <div><a href="/board">많이 본 게시물</a></div>

                    </div>


                    <div class="row">

                            <div class="row">
                                <div class="tableWrapper">
                                    <table class="tableList hitTable">
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
                                        <c:forEach var="Board" items="${hitBoard}">
                                            <tr onclick="location.href='/board/content/${Board.boardNo}'">
                                                <td><c:out value="${Board.boardNo}"/> </td>
                                                <td class="title"><c:out value="${Board.title}"/></td>
                                                <td><c:out value="${Board.userName}"/></td>
                                                <td><c:out value="${Board.simpleDate}"/></td>
                                                <td><c:out value="${Board.hit}"/></td>
                                                <td><c:out value="${Board.recommend}"/></td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                    </div>

                    <div class="line transparent little"></div>
                    <div class="row">
                        <div class="col-md-6 col-sm-6 trending-tags">
                            <h1 class="title-col">인기 태그</h1>
                            <div class="body-col">
                                <ol class="tags-list">
                                    <c:forEach var="TagList" items="${hotTagList}">
                                        <li><a href="/gallery/search-tag?tag=${TagList.tagValue}"><c:out value="${TagList.tagValue}"/></a></li>
                                    </c:forEach>
                                </ol>
                                <div class="hotTagImg">

                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6">
                            <h1 class="title-col">
                                댓글 많은 게시물

                            </h1>
                            <div class="body-col vertical-slider" data-max="4" data-nav="#hot-news-nav" data-item="article">
                                    <div class="tableWrapper">
                                        <table class="tableList">
                                          <tbody>
                                            <c:forEach var="Board" items="${hotReplyBoard}">
                                                <tr onclick="location.href='/board/content/${Board.boardNo}'">
                                                    <td class="title"><c:out value="${Board.title}"/> [${Board.replyCnt}]</td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                            </div>
                        </div>
                    </div>
                    <div class="line top">
                        <div>이미지 게시글</div>
                    </div>
                    <c:forEach var="b" items="${findNewImage}">
                    <div class="row">
                        <article class="col-md-12 article-list">
                            <div class="inner">
                                <figure>
                                    <img src="/loadFile?fileName=${b.fileName}" alt="NEW IMAGE!">
                                </figure>
                                <div class="details">
                                    <div class="detail">
                                        <div class="category">
                                            <a href="/board">NEW</a>
                                        </div>
                                    </div>
                                    <h1><a href="/board/content/${b.boardNo}">${b.title}</a></h1>

                                </div>
                            </div>
                        </article>
                    </div>
                    </c:forEach>

                </div>


                <%@include file="include/sidebar.jsp"%>


            </div>
        </div>
    </section>


    <!-- main end -->

    <%@ include file="./include/footer.jsp"%>
    <%@ include file="include/image.jsp"%>
</body>
</html>