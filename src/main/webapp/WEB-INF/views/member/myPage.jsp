<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <%@ include file="../include/static-head.jsp" %>
    <link rel="stylesheet" href="/css/board/board_list.css">
    <link rel="stylesheet" href="/css/mypage/mypage.css">

</head>
<style>
    .home {
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
                            </tr>
                            <tr>
                                <td>제목이 들어가는 곳입니다아아아아아아 [3]<br>
                                    <p>2022.11.17</p>
                                </td>
                            </tr>
                            <tr>
                                <td>제목이 들어가는 곳입니다아아아아아아 [3]<br>
                                    <p>2022.11.17</p>
                                </td>
                            </tr>
                            <tr>
                                <td>제목이 들어가는 곳입니다아아아아아아 [3]<br>
                                    <p>2022.11.17</p>
                                </td>
                            </tr>
                            <tr>
                                <td>제목이 들어가는 곳입니다아아아아아아 [3]<br>
                                    <p>2022.11.17</p>
                                </td>
                            </tr>
                        </table>
                    </div>

                </div>

                <div class="row">


                    <div class="tableWrapper">
                        <table class="tableList">
                            <tr>
                                <td class="home-title">댓글</td>
                            </tr>
                            <tr>
                                <td>댓글이 들어가는 곳입니다아아아아아아 [3]<br>
                                    <p>2022.11.17</p>
                                </td>
                            </tr>
                            <tr>
                                <td>댓글이 들어가는 곳입니다아아아아아아 [3]<br>
                                    <p>2022.11.17</p>
                                </td>
                            </tr>
                            <tr>
                                <td>댓글이 들어가는 곳입니다아아아아아아 [3]<br>
                                    <p>2022.11.17</p>
                                </td>
                            </tr>
                            <tr>
                                <td>댓글이 들어가는 곳입니다아아아아아아 [3]<br>
                                    <p>2022.11.17</p>
                                </td>
                            </tr>
                        </table>
                    </div>

                </div>

            </div>

        </div>
    </div>
</section>
<%@include file="../include/footer.jsp" %>
</body>


</html>
