<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <%@ include file="../include/static-head.jsp" %>
    <link rel="stylesheet" href="/css/board/board_list.css">
</head>
<style>

    .mymain-container {
        height: 100%;
        margin-left: 10%;
        margin-right: 10%;
    }

    .right-container {
        float: left;
        width: 80%;

    }

    .left-container {
        float: left;
        width: 20%;

    }

    .left-menu li {
        border: 1px #BDBDBD solid;
        border-radius: 5%;
        margin-right: 15%;
        text-align: left;
        padding-left: 5%;
        margin-top: 5%;
        padding-top: 4%;
        padding-bottom: 4%;
        font-weight: bold;

    }

    .home {
        background-color: #3b4890;
        color: white;
    }

    .tableList td {
        padding-bottom: 2px;
        text-align: left;
    }

    .tableList p {
        font-size: 6px;
    }

    .home-title {
        font-size: 20px;
        font-weight: bold;

        border-top: hidden;
        border-left: hidden;
        border-right: hidden;
        border-bottom: 2px #3b4890 solid;

        color: #FA5858;


    }


    .row:nth-child(2) {
        margin-top: 2%;
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
