<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="../include/static-head.jsp" %>
</head>
<body>
    <%@ include file="../include/header.jsp"%>
    <form id="remove-form" action="/board/remove" method="post">
        <input type="hidden" name="boardNo" value="${boardNo}">
    </form>

<script>
    const $removeForm = document.getElementById('remove-form')
    $removeForm.submit();
</script>
<%@ include file="../include/footer.jsp" %>
</body>
</html>