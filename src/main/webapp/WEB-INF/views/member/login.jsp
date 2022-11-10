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
                    <form>
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
<%--                            <a href="/admin/loginn" > 로그인</a>--%>
                                    <input type="button" value="로그인" >

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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    $(function(){
        $($("input[type='button']")[0]).click(function(){
            //로그인 post요청 (body 실어서 옮겨야, 노출되지 않음.)
            $.ajax({
                url:"/admin/loginn",
                type:"post",
                data:{
                    user_email:$("input[name='user_email']").val(),
                    user_pass:$("input[name='user_pass']").val()
                },
                success:function(result, status, xhr){
                    console.log(result);
                    if(result=="1"){
                        //관리자 모드 메인 페이지로 들어갈 수 있게 해주자!!
                        location.href="/";

                    }else{
                        alert("로그인 정보가 올바르지 않습니다.");
                    }
                }
            });
        });

    });
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