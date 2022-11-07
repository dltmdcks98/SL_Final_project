<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>

<style>
    @import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);

    .tableList {
        font-family: 'Jeju Gothic', sans-serif;
        width: 100%;
        border-bottom: 1px solid #29367c;
        border-collapse: collapse;

    }

    tbody tr:hover {
        background-color: #F1EFEF;
    }

    thead tr {
        display: table-row;
        border-style: groove hidden;
        border-color: #81F7D8;
    }

    thead th {
        font-weight: bold;
    }

    tbody tr {
        border-color: #E7E6E6;
        border: 1px;
        border-style: groove hidden;
    }

    tbody td {
        font-size: 15px;
        font-weight: 1;
    }

    td {
        text-align: center;
    }

    .title {
        text-align: left;
    }


</style>
<body>

<div>
    <table>
        <thead>
        <tr>
            <th>인기글들</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>ㅁㄴㅇㄴㅁㅇㅁㄴ</td>
        </tr>
        <tr>
            <td>ㅁㄴㅇㄴㅁㅇㅁㅂㅈㄷㄴ</td>
        </tr>
        <tr>
            <td>ㅁㄴㅇㄴㅁㅇㅁㄴ</td>
        </tr>
        </tbody>
    </table>

</div>

<div class="tableWrapper">
    <table class="tableList">
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
        <tr>
            <td>132131</td>
            <td class="title">갤 오늘이 첨이라 물어볼라고...</td>
            <td>ㅇㅇ</td>
            <td>16:03</td>
            <td>23</td>
            <td>2</td>
        </tr>
        <tr>
            <td>132130</td>
            <td class="title">뉴비 진로 질문</td>
            <td>뉴우비</td>
            <td>16:02</td>
            <td>11</td>
            <td>1</td>
        </tr>
        <tr>
            <td>132129</td>
            <td class="title">메인 페이지 헤카테 못바꿈?</td>
            <td>ㅇㅇ</td>
            <td>16:01</td>
            <td>686</td>
            <td>123</td>
        </tr>
        <tr>
            <td>1129</td>
            <td class="title">메인 페이ㄷㅈㄱㄷㄱ지 헤카테 못바꿈?</td>
            <td>ㅇㅈㄷㅈㅂㅇ</td>
            <td>16:01</td>
            <td>686</td>
            <td>123</td>
        </tr>
        </tbody>
    </table>
</div>

<div>
    <table>
        <thead>
            <tr>
                <th>인기글들</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>ㅁㄴㅇㄴㅁㅇㅁㄴ</td>
            </tr>
            <tr>
                <td>ㅁㄴㅇㄴㅁㅇㅁㄴ</td>
            </tr>
            <tr>
                <td>ㅁㄴㅇㄴㅁㅇㅁㄴ</td>
            </tr>
        </tbody>
    </table>

</div>
</body>
</html>
