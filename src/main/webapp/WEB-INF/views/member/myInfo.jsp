<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
    <%@ include file="../include/static-head.jsp" %>
    <link rel="stylesheet" href="/css/board/myPage_boardList.css">
    <link rel="stylesheet" href="/css/mypage/mypage.css">
    <%--    <script src="/js/board/jquery_board_write.js" defer ></script>--%>
</head>
<style>
    .myinfo {
        background-color: #3b4890;
        color: white;
    }
    .info-menu:first-child {
        background-color: #3b4890;
        color: white;
    }
</style>

<body>
<%@include file="../include/header.jsp" %>
<section>
    <div class="mymain-container">


        <div class="left-container">

            <ul class="left-menu">
                <li class="home" onclick="location.href='/mypage'">홈</li>
                <li class="posting" onclick="location.href='/mypage/myposting'">게시글</li>
                <li class="comment" onclick="location.href='/mypage/mycomment'">댓글</li>
                <li class="myinfo" onclick="location.href='/mypage/myinfo'">개인 정보 관리</li>

            </ul>


        </div>

        <div class="right-container">
            <div class="info-menu-container">
                <div class="info-menu" onclick="location.href='/mypage/myinfo'"> 기본 정보 변경</div>
                <div class="info-menu" onclick="location.href='/mypage/myinfo_tag'"> 관심사 설정</div>
                <div class="info-menu" onclick="location.href='/mypage/myinfo_drop'"> 회원 탈퇴</div>
            </div>

            <div class="menu-content">
                <div class="simple-info">
                    <p class="menu-title">기본 정보 변경</p>
                </div>


                <c:if test = "${not fn:contains(user.user_name,'kakao')}">
                    <form id = "update-form" action="/update" method="post" enctype="multipart/form-data">

                        <div class="form-group">
                            <input type="hidden" name="user_id" class="form-control" value="${user.user_id}" readonly>
                        </div>

                        <div class="form-group">
                            <label>닉네임</label>
                            <input type="text" name="user_name" class="form-control"  placeholder="닉네임">
                        </div>



                        <div class="form-group">
                            <label class="fw">비밀번호</label>
                            <input type="password" name="user_pass" class="form-control">
                        </div>

                        <div class="form-group">
                            <label>생년월일</label>
                            <input type="date" name="user_birth" class="form-control">
                        </div>

                        <div class="form-group">

                            <div class="insertFile circle">
                                <img class="profile-pic" src="https://t3.ftcdn.net/jpg/03/46/83/96/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg">
                            </div>
                            <div class="uploadDiv">
                                <input class="file-upload" type="file" accept="image/*" name="files" id="ajax-file"/>
                            </div>

                            <div class="form-group text-right">
                                <button type="submit" class="btn btn-primary btn-block" id="regist-btn">변경</button>
                            </div></div>
                    </form>
                </c:if>

                <c:if test = "${fn:contains(user.user_name,'kakao')}">
                    <form id = "update-form" action="/update-kakao" method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <input type="hidden" name="user_id" class="form-control" value="${user.user_id}" readonly>
                        </div>

                        <div class="form-group">
                            <label>닉네임</label>
                            <input type="text" name="user_name" class="form-control"  placeholder="닉네임">
                        </div>

                        <div class="form-group">
                            <div class="fileDrop Circle">
                                <img class="profile-pic" src="https://t3.ftcdn.net/jpg/03/46/83/96/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg">
                                <input class="file-upload uploaded-list" type="file" accept="image/*"/>
                            </div>
                            <div class="uploadDiv">
                                <input type="file" name="files" id="ajax-file">
                            </div>
                            <div class="uploaded-list ">

                            </div>


                            <div class="form-group text-right">
                                <button type="submit" class="btn btn-primary btn-block" id="regist-btn">변경</button>
                            </div>
                        </div>
                    </form>
                </c:if>
            </div>

        </div>


    </div>
</section>
<script>
    $(document).ready(function () {


        function isImageFile(originFileName) {
            //정규표현식
            const pattern = /jpg$|gif$|png$/i;
            return originFileName.match(pattern);
        }

        // 파일의 확장자에 따른 렌더링 처리
        function checkExtType(fileName) {

            //원본 파일 명 추출
            let originFileName = fileName.substring(fileName.indexOf("_") + 1);

            // hidden input을 만들어서 변환파일명을 서버로 넘김
            const $hiddenInput = document.createElement('input');
            $hiddenInput.setAttribute('type', 'hidden');
            $hiddenInput.setAttribute('name', 'fileNames');
            $hiddenInput.setAttribute('value', fileName);

            console.log("hidden : ", $hiddenInput);

            $('#update-form').append($hiddenInput);

            //확장자 추출후 이미지인지까지 확인
            if (isImageFile(originFileName)) { // 파일이 이미지라면

                const $img = document.createElement('img');
                $img.classList.add('img-sizing');
                $img.setAttribute('src', '/loadFile?fileName=' + fileName);
                $img.setAttribute('alt', originFileName);
            }
        }
        function showFileData(fileNames) {

            for (let fileName of fileNames) {
                checkExtType(fileName);
            }
        }

        let readURL = function(input) {
            if (input.files && input.files[0]) {
                let reader = new FileReader();

                reader.onload = function (e) {
                    $('.profile-pic').attr('src', e.target.result);
                }

                reader.readAsDataURL(input.files[0]);
            }
        }


        $(".file-upload").on('change', function(){
            readURL(this);
        });
        // 파일첨부로 하는건 이상해서 추후에 이미지 버튼하나 만들어서 클릭시 기존의 파일첨부를 누르는 이벤트
        $(".upload-button").on('click', function() {
            $(".file-upload").click();
        });

        // 파일 업로드 이벤트
        // const $uploadFile = $('.insertFile');

        $(".insertFile").on('change', e => {
            e.preventDefault();

            const files = e.originalEvent.dataTransfer.files;
            console.log('file data: ', files);

            const $fileInput = $('#ajax-file');
            $fileInput.prop('files', files);

            console.log($fileInput);

            // 파일 데이터를 비동기 전송
            const formData = new FormData();

            for (let file of $fileInput[0].files) {
                formData.append('files', file);
            }

            // 비동기 요청 전송
            const reqInfo = {
                method: 'POST',
                body: formData
            };
            fetch('/profile-upload', reqInfo)
                .then(res => {
                    console.log("status : ",res.status);
                    return res.json();
                })
                .then(fileNames => {
                    console.log(fileNames);

                    showFileData(fileNames);
                });

        });

});


</script>

<script>

</script>
<%@include file="../include/footer.jsp" %>
</body>


</html>
