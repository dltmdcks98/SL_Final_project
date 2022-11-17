<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%--<script src="/js/jquery.js"></script>
<script src="/js/jquery.migrate.js"></script>
<script src="/scripts/bootstrap/bootstrap.min.js"></script>
<script src="/scripts/jquery-number/jquery.number.min.js"></script>
<script src="/scripts/owlcarousel/dist/owl.carousel.min.js"></script>
<script src="/scripts/magnific-popup/dist/jquery.magnific-popup.min.js"></script>
<script src="/scripts/easescroll/jquery.easeScroll.js"></script>
<script src="/scripts/sweetalert/dist/sweetalert.min.js"></script>
<script src="/scripts/toast/jquery.toast.min.js"></script>
<script src="/js/demo.js"></script>
<script src="/js/e-magz.js"></script>--%>

<script>
    const $listBtn = document.getElementById('list-btn');
    const $editBtn = document.getElementById('edit-btn');
    const $delBtn = document.getElementById('del-btn');

    // console.log($listBtn);

    //목록버튼
    $listBtn.onclick = e => {

        <%@include file="../include/reply.jsp"%>

        location.href = '/board?pageNum=${p.pageNum}&amount=${p.amount}';
    };

    //수정버튼
    $editBtn.onclick = e => {
        if ($editBtn !== null) {
            confirm('수정하시겠습니까?');
            location.href = '/board/edit?boardNo=${b.boardNo}';
        }
    };

    //삭제버튼
    $delBtn.onclick = e => {
        if ($delBtn !== null) {
            confirm('삭제하시겠습니까?');
            location.href = '/board/delete?boardNo=${b.boardNo}';
        }
    };
</script>