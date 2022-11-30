<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<footer class="footer">
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="block">
                    <h1 class="block-title">프로젝트 소개</h1>
                    <div class="block-body">
                        <figure class="foot-logo">
                            <img src="/img/logo1.png" class="img-responsive" alt="Logo">
                        </figure>
                        <p class="brand-description">
                            갤러리와 핀터레스트가 공존하는 사이트
                        </p><br>
                        <p></p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="block">
                    <h1 class="block-title">인기 태그</h1>
                    <div class="block-body">
                        <ul class="tags">
                            <c:forEach var="TagList" items="${hotTagList}">
                                <li><a href="/gallery/search-tag?tag=${TagList.tagValue}"><c:out value="${TagList.tagValue}"/></a></li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>

            </div>
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="block">
                    <h1 class="block-title">인기글</h1>
                    <div class="block-body">
                        <article class="article-mini">
                            <div class="inner">
                                <c:forEach var="Board" items="${hitBoard}">
                                    <div onclick="location.href='/board/content/${Board.boardNo}'">
                                        <span class="title"><c:out value="${Board.title}"/></span>
                                        <span class="writer"><c:out value="${Board.userName}"/></span>
                                    </div>
                                </c:forEach>
                            </div>
                        </article>
                    </div>
                </div>
            </div>


        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="copyright">
                    COPYRIGHT &copy; SL_PROJECT 2022. ALL RIGHT RESERVED.
                    <div>
                        Github Link <i class="ion-heart"></i> <a href="https://github.com/dltmdcks98/SL_Final_project" target="_blank">SL_PROJECT</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>

