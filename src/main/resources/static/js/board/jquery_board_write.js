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
            $a.innerHTML += '<span>' + originFileName + '</span';

            $('.uploaded-list').append($a);

        }


    }


    // 드롭한 파일을 화면에 보여주는 함수
    function showFileData(fileNames) {

        // 이미지인지? 이미지가 아닌지에 따라 구분하여 처리
        // 이미지면 썸네일을 렌더링하고 아니면 다운로드 링크를 렌더링한다.
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
            .css('border-color', 'red')
            .css('background', 'lightgray');
    });

    // drag 탈출 이벤트
    $dropBox.on('dragleave', e => {
        e.preventDefault();
        $dropBox
            .css('border-color', 'gray')
            .css('background', 'transparent');
    });

    // drop 이벤트
    $dropBox.on('drop', e => {
        e.preventDefault();
        // console.log('드롭 이벤트 작동!');

        // 드롭된 파일 정보를 서버로 전송

        // 1. 드롭된 파일 데이터 읽기
        // console.log(e);
        const files = e.originalEvent.dataTransfer.files;
        // console.log('drop file data: ', files);

        // 2. 읽은 파일 데이터를 input[type=file]태그에 저장
        const $fileInput = $('#ajax-file');
        $fileInput.prop('files', files);

        // console.log($fileInput);

        // 3. 파일 데이터를 비동기 전송하기 위해서는 FormData객체가 필요
        const formData = new FormData();

        // 4. 전송할 파일들을 전부 FormData안에 포장
        for (let file of $fileInput[0].files) {
            formData.append('files', file);
        }

        // 5. 비동기 요청 전송
        const reqInfo = {
            method: 'POST',
            body: formData
        };
        fetch('/ajax-upload', reqInfo)
            .then(res => {
                //console.log(res.status);
                return res.json();
            })
            .then(fileNames => {
                console.log(fileNames);

                showFileData(fileNames);
            });

    });

});