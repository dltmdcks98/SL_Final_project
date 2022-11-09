<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
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
							<h4>회원가입</h4>

							<form id = "regist-form" action="/admin/regist" method="post">

								<div class="form-group">
									<label>이메일</label>
									<input type="text" name="user_email" class="form-control">
								</div>
								<div class="form-group">
									<label class="fw">비밀번호</label>
									<input type="password" name="user_pass" class="form-control">
								</div>

								<div class="form-group">
									<label>닉네임</label>
									<input type="text" name="user_name" class="form-control">
								</div>

								<div class="form-group">
									<label>생년월일</label>
									<input type="date" name="user_birth" class="form-control">
								</div>

								<div class="form-group">
									<label>성별</label><br>
									<input type="radio" name="user_sex" value="m"> 남성
									<input type="radio" name="user_sex" value="f"> 여성
								</div>

								<div class="form-group text-right">
									<button class="btn btn-primary btn-block" id="regist-btn">회원가입</button>
								</div>
								<div class="form-group text-center">
									<span class="text-muted">계정이 이미 있으십니까?</span> <a href="/login" class="login">로그인</a>
								</div>
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
	<script>
		const $regBtn = document.getElementById('regist-btn');

		$regBtn.onclick = e => {
			const $form = document.getElementById('reigst-form');
			$form.submit();
		};

	</script>


		<script src="../../../../../../../../Downloads/Magz-master/Magz-master/js/jquery.js"></script>
		<script src="../../../../../../../../Downloads/Magz-master/Magz-master/js/jquery.migrate.js"></script>
		<script src="../../../../../../../../Downloads/Magz-master/Magz-master/scripts/bootstrap/bootstrap.min.js"></script>
		<script>var $target_end=$(".best-of-the-week");</script>
		<script src="../../../../../../../../Downloads/Magz-master/Magz-master/scripts/jquery-number/jquery.number.min.js"></script>
		<script src="../../../../../../../../Downloads/Magz-master/Magz-master/scripts/owlcarousel/dist/owl.carousel.min.js"></script>
		<script src="../../../../../../../../Downloads/Magz-master/Magz-master/scripts/magnific-popup/dist/jquery.magnific-popup.min.js"></script>
		<script src="../../../../../../../../Downloads/Magz-master/Magz-master/scripts/easescroll/jquery.easeScroll.js"></script>
		<script src="../../../../../../../../Downloads/Magz-master/Magz-master/scripts/sweetalert/dist/sweetalert.min.js"></script>
		<script src="../../../../../../../../Downloads/Magz-master/Magz-master/scripts/toast/jquery.toast.min.js"></script>
		<script src="../../../../../../../../Downloads/Magz-master/Magz-master/js/demo.js"></script>
		<script src="../../../../../../../../Downloads/Magz-master/Magz-master/js/e-magz.js"></script>
	</body>
</html>