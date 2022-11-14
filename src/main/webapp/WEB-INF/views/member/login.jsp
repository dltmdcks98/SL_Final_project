<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="../include/static-head.jsp" %>
</head>
<body>
<%@include file="../include/header.jsp"%>

<section class="login first grey">
    <div class="container">
        <div class="box-wrapper">
            <div class="box box-border">
                <div class="box-body">
                    <h4>Login</h4>
                    <form method="POST" action="/admin/login">
                        <div class="form-group">
                            <label>이메일</label>

                            <input type="text" name="user_email" class="form-control">
                        </div>

                        <div class="form-group">
                            <label>비밀번호</label>

                                <a href="forgot.html" class="pull-right">비밀번호를 잊으셨나요?</a>
                            </label>
                            <input type="password" name="user_pass" class="form-control">
                        </div>
                        <div class="form-group text-right">
                            <button name="button" class="btn btn-block btn-primary text-light">로그인</button>

                        </div>
                        <div class="form-group text-center">
                            <span class="text-muted">계정이 없으신가요?</span> <a href="register">회원가입</a>
                        </div>
                        <div class="title-line">
                            or
                        </div>
                        <a href="#" class="btn btn-social btn-block facebook"><i class="ion-social-facebook"></i> Login with Facebook</a>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Start footer -->
<%@include file="../include/footer.jsp"%>
<!-- End Footer -->

<!-- JS -->

</script>

<script src="js/jquery.js"></script>
<script src="js/jquery.migrate.js"></script>
<script src="scripts/bootstrap/bootstrap.min.js"></script>
<script>var $target_end=$(".best-of-the-week");</script>
<script src="scripts/jquery-number/jquery.number.min.js"></script>
<script src="scripts/owlcarousel/dist/owl.carousel.min.js"></script>
<script src="scripts/magnific-popup/dist/jquery.magnific-popup.min.js"></script>
<script src="scripts/easescroll/jquery.easeScroll.js"></script>
<script src="scripts/sweetalert/dist/sweetalert.min.js"></script>
<script src="scripts/toast/jquery.toast.min.js"></script>
<script src="js/demo.js"></script>
<script src="js/e-magz.js"></script>
</body>
</html>