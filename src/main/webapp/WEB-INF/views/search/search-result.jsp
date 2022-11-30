<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="../include/static-head.jsp" %>
    <link rel="stylesheet" href="/css/board/search_list.css">
    <link rel="stylesheet" href="/css/board/index.css">
    <script src="/js/board/list.js" defer></script>
</head>
<style>
.myMore:hover{
    font-weight: bold;
    cursor: pointer;

}
</style>

<body class="skin-orange">
<%@ include file="../include/header.jsp" %>

<section class="home">

    <div class="container">
        <div class="row">
            <div class="col-md-8 col-sm-12 col-xs-12">
                <p class="hr"></p><br>
                    <div><p class="main-title" href="/">제목이 포함된 게시글</p></div><br>
                <div class="row">

                    <div class="row">
                        <div class="tableWrapper">
                            <table class="tableList">
                                <tbody>

                                <c:forEach var="b" items="${b}">


                                    <c:if test="${fn:contains(b.title , param.keyword)}">
                                        <tr class="tr-hover" onclick="location.href='/board/content/${b.boardNo}?pageNum=${p.pageNum}&amount=${p.amount}'">
                                            <td class="title">${b.title} <c:if test="${b.replyCnt != 0}">[${b.replyCnt}]</c:if> </td>
                                        </tr>
                                        <tr>
                                            <td class="content">${b.content}</td>
                                        </tr>
                                        <tr>
                                            <td class="date"><c:forEach var="tag" items="${b.tagList}">#${tag} &nbsp &nbsp</c:forEach>${b.simpleDate}<br><br><br></td>
                                        </tr>


                                    </c:if>
                                </c:forEach>
                                </tbody>
                            </table>
                            <a class="myMore" onclick="location.href='/board?type=title&keyword=${param.keyword}'">더보기</a>

                        </div>
                    </div>
                    <div>

                    </div>

                </div>

                <br>
                <p class="hr"></p><br>
                    <div><p class="main-title" href="/">내용이 포함된 게시글</p></div><br>




                <div class="row">

                    <div class="row">
                        <div class="tableWrapper">
                            <table class="tableList">
                                <c:forEach var="b" items="${b}">
                                    <c:if test="${fn:contains(b.content , param.keyword)}">

                                        <tr class = "tr-hover"onclick="location.href='/board/content/${b.boardNo}?pageNum=${p.pageNum}&amount=${p.amount}'">
                                            <td class="title">${b.title} <c:if test="${b.replyCnt != 0}">[${b.replyCnt}]</c:if> </td>
                                        </tr>
                                        <tr>
                                            <td class="content">${b.content}</td>
                                        </tr>
                                        <tr>
                                            <td class="date"><c:forEach var="tag" items="${b.tagList}">#${tag} &nbsp &nbsp</c:forEach>${b.simpleDate}<br><br><br></td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                                </tbody>
                            </table>
                            <a class="myMore" onclick="location.href='/board?type=content&keyword=${param.keyword}'">더보기</a>
                        </div>
                    </div>
                    <div>

                    </div>

                </div>
                <%--                                    태그로 찾기--%>
                <br>
                <p class="hr"></p><br>
                    <div><p class="main-title" href="/">태그가 포함된 게시글</p></div><br>



                <div class="row">

                    <div class="row">
                        <div class="tableWrapper">
                            <table class="tableList">
                                <c:forEach var="b" items="${b}">
                                    <c:if test="${fn:contains(b.tagList , param.keyword)}">

                                        <tr class = "tr-hover" onclick="location.href='/board/content/${b.boardNo}?pageNum=${p.pageNum}&amount=${p.amount}'">
                                            <td class="title">${b.title} <c:if test="${b.replyCnt != 0}">[${b.replyCnt}]</c:if> </td>
                                        </tr>
                                        <tr>
                                            <td class="content">${b.content}</td>
                                        </tr>
                                        <tr>
                                            <td class="date"><c:forEach var="tag" items="${b.tagList}">#${tag} &nbsp &nbsp</c:forEach>${b.simpleDate}<br><br><br></td>
                                        </tr>
                                    </c:if>
                                </c:forEach>

                                </tbody>
                            </table>
                            <a class="myMore" onclick="location.href='/board?type=tagValue&keyword=${param.keyword}'">더보기</a>
                        </div>
                    </div>
                    <div>

                    </div>

                </div>


            </div>

            <%@include file="../include/sidebar.jsp"%>
        </div>
    </div>

</section>


<%@ include file="../include/footer.jsp" %>
<script type="text/javascript">

    const keyword = '${param.keyword}';
console.log(keyword);
    $(document).ready(function(){
        $(keyword).css('color','red');
    });





</script>


</body>
</html>