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
                    페이징 처리 + 페이지 버튼
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
</body>
</html>
