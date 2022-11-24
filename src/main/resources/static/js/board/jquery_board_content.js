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
            $img.setAttribute('src', '/img/hot.png');
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

    // 파일 목록 불러오기
    function showFileList() {
        fetch('/board/file/' + bno)
            .then(res => res.json())
            .then(fileNames => {
                showFileData(fileNames);
            });
    }

    showFileList();



});