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
                $('.file-upload').append($img);
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


        $(".file-upload").on('change', function(e){
            readURL(this);
            e.preventDefault();
            console.info("readURL : ", readURL);
            const files = e.originalEvent.dataTransfer.files;
            console.log('file data: ', files);

            const $fileInput = $('#profile-upload');
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

        // 파일첨부로 하는건 이상해서 추후에 이미지 버튼하나 만들어서 클릭시 기존의 파일첨부를 누르는 이벤트
        // $(".upload-button").on('click', function() {
        //     $(".file-upload").click();
        // });

        // 파일 업로드 이벤트
        // const $uploadFile = $('.insertFile');

        $(".insertFile").on('change', e => {
            e.preventDefault();

            const files = e.originalEvent.dataTransfer.files;
            console.log('file data: ', files);

            const $fileInput = $('#profile-upload');
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