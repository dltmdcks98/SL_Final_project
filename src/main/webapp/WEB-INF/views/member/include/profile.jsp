<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>

        function isImageFile(originFileName) {
        //정규표현식
            const pattern = /jpg$|gif$|png$/i;
            return originFileName.match(pattern);
        }

        // 파일의 확장자에 따른 렌더링 처리
        function checkExtType(fileName) {

            let originFileName = fileName.toString().substring(fileName.indexOf("_") + 1);

            if (isImageFile(originFileName)) {

                const $img = document.createElement('img');
                $img.setAttribute('src', '/loadFile?fileName=' + fileName);
                $img.setAttribute('alt', originFileName);
                $('.uploadDiv').append($img);
                $('.uploadDiv').addClass('img-sizing');
                $('.fileDrop').remove();
                $('.beforeProfile').remove();
                alert("변경되었습니다.");
            }
        }

        const $dropBox = $('.fileDrop');

        $dropBox.on('dragover dragenter', e => {
            e.preventDefault();
            $dropBox
                .css('background', 'skyblue');
        });

        $dropBox.on('dragleave', e => {
            e.preventDefault();
            $dropBox
                .css('background', 'transparent');
        });

        $dropBox.on('drop', e => {
            e.preventDefault();
            const files = e.originalEvent.dataTransfer.files;

            const $fileInput = $('#profile-file');
            $fileInput.prop('files', files);


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
                    return res.json();
                })
                .then(fileNames => {
                    if (confirm("프로필을 변경하시겠어요?")) {
                        checkExtType(fileNames);
                    }
                })
                .catch(error=>{
                    alert("프로필 변경에 실패했습니다.");
                    console.log(error);
                });
        });

</script>