<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <%@ include file="../include/static-head.jsp" %>
    <link rel="stylesheet" href="/css/board/board_list.css">
    <link rel="stylesheet" href="/css/mypage/mypage.css">
</head>
<style>
    .posting {
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
                                <td class="t1">
                                    <input type="text" name="q" class="mysearch" placeholder="게시글 제목 검색">
                                    <button class="btn btn-primary"><i class="ion-search"></i></button>
                                </td>


                            </tr>
                            <c:forEach var="b" items="${bList}">
                                <tr onclick="location.href='/board/content/${b.boardNo}'" >
                                    <td class="title">${b.title} <c:if test="${b.replyCnt != 0}">[${b.replyCnt}]</c:if>
                                        <p>${b.simpleDate}</p>
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
                                    <li class="page-item"><a class="page-link" href="/mypage/myposting?pageNum=${myBoardPageMaker.beginPage - 1}&amount=${myBoardPageMaker.page.amount}">◀</a>
                                    </li>
                                </c:if>


                                <c:forEach var="n" begin="${myBoardPageMaker.beginPage}" end="${myBoardPageMaker.endPage}" step="1">
                                    <li data-page-num="${n}" class="page-item">
                                        <a class="page-link" href="/mypage/myposting?pageNum=${n}&amount=${myBoardPageMaker.page.amount}">${n}</a>
                                    </li>
                                </c:forEach>

                                <c:if test="${myBoardPageMaker.next}">
                                    <li class="page-item"><a class="page-link" href="/mypage/myposting?pageNum=${myBoardPageMaker.endPage + 1}&amount=${myBoardPageMaker.page.amount}">▶</a>
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
</body>
<script>
    //현재 위치한 페이지에 active 스타일 부여하기
    function appendPageActive() {

        // 현재 내가 보고 있는 페이지 넘버
        const curPageNum = '${myBoardPageMaker.page.pageNum}';
        console.log("현재페이지: ", curPageNum);

        // 페이지 li태그들을 전부 확인해서
        // 현재 위치한 페이지 넘버와 텍스트컨텐츠가 일치하는
        // li를 찾아서 class active 부여
        const $ul = document.querySelector('.pagination');

        for (let $li of [...$ul.children]) {
            if (curPageNum === $li.dataset.pageNum) {
                $li.classList.add('active');
                break;
            }
        }

    }

    (function (){
        appendPageActive();
    })();

</script>

</html>
