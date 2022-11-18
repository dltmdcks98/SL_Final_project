<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
    const $listBtn = document.getElementById('list-btn');
    const $editBtn = document.getElementById('edit-btn');
    const $delBtn = document.getElementById('del-btn');

    // console.log($listBtn);

    //목록버튼
    $listBtn.onclick = e => {


        location.href = '/board?pageNum=${p.pageNum}&amount=${p.amount}';
    };

    //수정버튼
    $editBtn.onclick = e => {
        if ($editBtn !== null) {
            location.href = '/board/edit?boardNo=${b.boardNo}';
        }

    };

    //삭제버튼
    $delBtn.onclick = e => {
        if ($delBtn !== null) {
            location.href = '/board/remove?boardNo=${b.boardNo}';
        }

    };
</script>
