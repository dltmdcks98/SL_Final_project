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

        $('#write-form').append($hiddenInput);

        //확장자 추출후 이미지인지까지 확인
        if (isImageFile(originFileName)) { // 파일이 이미지라면

            const $img = document.createElement('img');
            $img.classList.add('img-sizing');
            $img.setAttribute('src', '/loadFile?fileName=' + fileName);
            $img.setAttribute('alt', originFileName);
            $('.uploaded-list').append($img);
        }

        // 이미지가 아니라면 다운로드 링크를 생성
        else {

            const $a = document.createElement('a');
            $a.setAttribute('href', '/loadFile?fileName=' + fileName);

            const $img = document.createElement('img');
            $img.classList.add('img-sizing');
            $img.setAttribute('src', '/img/hot_png');
            $img.setAttribute('alt', originFileName);

            $a.append($img);
            $a.innerHTML += '<span>' + originFileName + '</span>';

            $('.uploaded-list').append($a);
        }
    }
    function showFileData(fileNames) {

        for (let fileName of fileNames) {
            checkExtType(fileName);
        }
    }



    // drag & drop 이벤트
    const $dropBox = $('.fileDrop');

    // drag 진입 이벤트
    $dropBox.on('dragover dragenter', e => {
        e.preventDefault();
        $dropBox
            .css('border-color', '#690153')
            .css('background', 'skyblue');
    });

    // drag 탈출 이벤트
    $dropBox.on('dragleave', e => {
        e.preventDefault();
        $dropBox
            .css('border-color', '#077133')
            .css('background', 'transparent');
    });

    // drop 이벤트
    $dropBox.on('drop', e => {
        e.preventDefault();
        // console.log(e);
        // console.log('드롭 이벤트');
        const files = e.originalEvent.dataTransfer.files;
        // console.log('drop file data: ', files);

        const $fileInput = $('#ajax-file');
        $fileInput.prop('files', files);

        // console.log($fileInput);

        //  파일 데이터를 비동기 전송
        const formData = new FormData();

        for (let file of $fileInput[0].files) {
            formData.append('files', file);
        }

        // 비동기 요청 전송
        const reqInfo = {
            method: 'POST',
            body: formData
        };
        fetch('/ajax-upload', reqInfo)
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