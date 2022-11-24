<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="./include/static-head.jsp" %>
    <link rel="stylesheet" href="/css/board/board_list.css">

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
                            <h1 class="title-col">인기 관심사</h1>
                            <div class="body-col">
                                <ol class="tags-list">
                                    <c:forEach var="TagList" items="${hotTagList}">
                                        <li><a href="/gallery/search-tag?tag=${TagList.tagValue}"><c:out value="${TagList.tagValue}"/></a></li>
                                    </c:forEach>

                                </ol>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6">
                            <h1 class="title-col">
                                댓글 많은 게시물
                                <div class="carousel-nav" id="hot-news-nav">
                                    <div class="prev">
                                        <i class="ion-ios-arrow-left"></i>
                                    </div>
                                    <div class="next">
                                        <i class="ion-ios-arrow-right"></i>
                                    </div>
                                </div>
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


                <div class="col-xs-6 col-md-4 sidebar" id="sidebar">
                    <aside>
                        <div class="aside-body">
                            <div class="featured-author">
                                <div class="featured-author-inner">
                                    <div class="featured-author-cover">
                                        <div class="badges">
                                            <div class="badge-item"><i class="ion-star"></i> 이달의 인기태그</div>
                                        </div>
                                        <div class="featured-author-center">
                                            <figure class="featured-author-picture">
                                                <img src="/img/img01.jpg" alt="Sample Article">
                                            </figure>
                                            <div class="featured-author-info">
                                                <h2 class="name">John Doe</h2>
                                                <div class="desc"># 아이유</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="featured-author-body">
                                        <div class="featured-author-count">
                                            <div class="item">
                                                <a href="#">
                                                    <div class="name">게시글</div>
                                                    <div class="value">208</div>
                                                </a>
                                            </div>
                                            <div class="item">
                                                <a href="#">
                                                    <div class="name">댓글</div>
                                                    <div class="value">3,729</div>
                                                </a>
                                            </div>
                                            <div class="item">
                                                <a href="#">
                                                    <div class="icon">
                                                        <div>더보기</div>
                                                        <i class="ion-chevron-right"></i>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="featured-author-quote">
                                            " <c:out value="${hotTagList[0].tagValue}"/> "
                                        </div>
                                        <div class="block">
                                            <h2 class="block-title">Photos</h2>

                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </aside>

                </div>
            </div>
        </div>
    </section>


    <!-- main end -->

    <%@ include file="./include/footer.jsp"%>
    <%@ include file="include/image.jsp"%>
</body>
</html>