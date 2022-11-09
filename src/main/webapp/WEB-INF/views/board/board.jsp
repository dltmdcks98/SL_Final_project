<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="../include/static-head.jsp" %>
    <link rel="stylesheet" href="/css/board/board_list.css">
</head>

<body class="skin-orange">
    <%@ include file="../include/header.jsp" %>

    <section>
        <!--for demo wrap-->
        <div class="wrap">

            <div class="board-list">
                <table>
                    <tbody>
                    <tr>
                        <th>번호</th>
                        <th>작성자</th>
                        <th>제목</th>
                        <th>작성일</th>
                        <th>조회</th>
                        <th>추천수</th>
                    </tr>
                    <% for(int i=1; i<=20; i++) { %>
                    <tr>
                        <td>board_id</td>
                        <td>user_id</td>
                        <td>title</td>
                        <td>reg_date</td>
                        <td>hit</td>
                        <td>recommend</td>
                    </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>
            <div>
                <nav class="page">
                    <ul class="pagination pagination-lg pagination-custom">

<%--                        <c:if test="${pm.prev}">--%>
<%--                            <li class="page-item">--%>
<%--                                <a class="page-link" href="/board/list?pageNum=${pm.beginPage - 1}&amount=${pm.page.amount}">prev</a>--%>
<%--                            </li>--%>
<%--                        </c:if>--%>

                        <c:forEach var="n" begin="${1}" end="${10}" step="1">
                            <li data-page-num="${n}" class="page-item">
                                <a class="page-link" href="/board/list?pageNum=${n}&amount=${pm.page.amount}">${n}</a>
                            </li>
                        </c:forEach>

<%--                        <c:if test="${pm.next}">--%>
<%--                            <li class="page-item">--%>
<%--                                <a class="page-link" href="/board/list?pageNum=${pm.endPage + 1}&amount=${pm.page.amount}">next</a>--%>
<%--                            </li>--%>
<%--                        </c:if>--%>

                    </ul>
                </nav>
                <div class="btn-write">
                    <a href="board/write">글쓰기</a>
                </div>
            </div>
            <!-- 글쓰기 버튼 -->

            <div class="search">
                <form action="/board/list" method="get">


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
    </section>

<%@ include file="../include/footer.jsp"%>


    <script>
        function alertServerMessage() {
            const msg = '${msg}';
            // console.log('msg: ', msg);

            if (msg === 'reg-success') {
                alert('게시물이 정상 등록되었습니다.');
            }
        }


        function detailEvent() {
            //상세보기 요청 이벤트
            const $table = document.querySelector(".articles");

            $table.addEventListener('click', e => {


                if (!e.target.matches('.articles td')) return;

                console.log('tr 클릭됨! - ', e.target);

                let bn = e.target.parentElement.firstElementChild.textContent;
                console.log('글번호: ' + bn);

                location.href = '/board/content/' + bn
                    + "?pageNum=${pm.page.pageNum}"
                    + "&amount=${pm.page.amount}";
            });
        }

        //현재 위치한 페이지에 active 스타일 부여하기
        function appendPageActive() {

            // 현재 내가 보고 있는 페이지 넘버
            const curPageNum = '${pm.page.pageNum}';
            // console.log("현재페이지: ", curPageNum);

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

        // 옵션태그 고정
        function fixSearchOption() {
            const $select = document.getElementById('search-type');

            for (let $opt of [...$select.children]) {
                if ($opt.value === '${s.type}') {
                    $opt.setAttribute('selected', 'selected');
                    break;
                }
            }
        }


        (function () {

            alertServerMessage();
            detailEvent();
            appendPageActive();
            fixSearchOption();

        })();

    </script>

</body>
</html>
