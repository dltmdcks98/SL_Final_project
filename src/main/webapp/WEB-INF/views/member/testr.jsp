<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <%@ include file="../include/static-head.jsp" %>
  <link rel="stylesheet" href="/css/board/board_list.css">
  <script src="/js/board/list.js" defer></script>
</head>

<body class="skin-orange">
<%@ include file="../include/header.jsp" %>

<section class="home">

  <div class="container">
    <div class="row">
      <div class="col-md-8 col-sm-12 col-xs-12">


        <div class="line">

          <div><a href="/">제목이 포함된 게시글</a></div>

        </div>


        <div class="row">

          <div class="row">
            <div class="tableWrapper">
              <table class="tableList">


                <tbody>
                <c:forEach var="b" items="${b}">
                  <%--                                    제목으로 찾기--%>
                  <c:if test="${fn:contains(b.title , param.keyword)}">
                    <tr onclick="location.href='/board/content/${b.boardNo}?pageNum=${p.pageNum}&amount=${p.amount}'">
                      <td>${b.boardNo}</td>
                      <td>${b.userName}</td>

                      <td class="title">${b.title} <c:if
                              test="${b.replyCnt != 0}">[${b.replyCnt}]</c:if>
                      </td>


                      <td>${b.simpleDate}</td>
                      <td>${b.hit}</td>
                      <td>${b.recommend}</td>
                    </tr>
                  </c:if>
                </c:forEach>
                <%--                                    내용으로 찾기--%>

                </tbody>
              </table>
            </div>
          </div>
          <div>

          </div>

        </div>


        <div class="line">

          <div><a href="/">내용이 포함된 게시글</a></div>

        </div>


        <div class="row">

          <div class="row">
            <div class="tableWrapper">
              <table class="tableList">
                <c:forEach var="b" items="${b}">
                  <c:if test="${fn:contains(b.content , param.keyword)}">

                    <tr onclick="location.href='/board/content/${b.boardNo}?pageNum=${p.pageNum}&amount=${p.amount}'">
                      <td>${b.boardNo}</td>
                      <td>${b.userName}</td>

                      <td class="title">${b.title} <c:if
                              test="${b.replyCnt != 0}">[${b.replyCnt}]</c:if>
                      </td>


                      <td>${b.simpleDate}</td>
                      <td>${b.hit}</td>
                      <td>${b.recommend}</td>
                    </tr>
                  </c:if>
                </c:forEach>
                </tbody>
              </table>
            </div>
          </div>
          <div>

          </div>

        </div>
        <%--                                    태그로 찾기--%>
        <div class="line">

          <div><a href="/">태그가 포함된 게시글</a></div>

        </div>


        <div class="row">

          <div class="row">
            <div class="tableWrapper">
              <table class="tableList">
                <c:forEach var="b" items="${b}">
                  <c:if test="${fn:contains(b.tagValue , param.keyword)}">

                    <tr onclick="location.href='/board/content/${b.boardNo}?pageNum=${p.pageNum}&amount=${p.amount}'">
                      <td>${b.boardNo}</td>
                      <td>${b.userName}</td>

                      <td class="title">${b.title} <c:if
                              test="${b.replyCnt != 0}">[${b.replyCnt}]</c:if>
                      </td>


                      <td>${b.simpleDate}</td>
                      <td>${b.hit}</td>
                      <td>${b.recommend}</td>
                    </tr>
                  </c:if>
                </c:forEach>
                </tbody>
              </table>
            </div>
          </div>
          <div>

          </div>

        </div>


      </div>


    </div>
  </div>

</section>


<%@ include file="../include/footer.jsp" %>

</body>
</html>