$(document).ready(function () {

    function isImageFile(originFileName) {
        //정규표현식
        const pattern = /jpg$|gif$|png$/i;
        return originFileName.match(pattern);
    }

    // 렌더링 처리
    function checkExtType(fileName) {

        let originFileName = fileName.substring(fileName.indexOf("_") + 1);

        if (isImageFile(originFileName)) {

            const $img = document.createElement('img');
            $img.classList.add('img-sizing');
            $img.setAttribute('src', '/loadFile?fileName=' + fileName);
            $img.setAttribute('alt', originFileName);
            $('.uploaded-list').append($img);
        }

    }


    // 드롭한 파일을 화면에 보여주는 함수
    function showFileData(fileNames) {

        for (let fileName of fileNames) {
            checkExtType(fileName);
        }
    }

    // 파일 목록 불러오기
    function showFileList() {

        fetch('/board/file/'+bno)
            .then(res => res.json())
            .then(fileNames => {
                showFileData(fileNames);
            });
    }
    showFileList();
});