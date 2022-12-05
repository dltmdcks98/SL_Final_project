<script>
const openProfileDiv = document.querySelector('.openProfileDiv');
const $profileDiv = $('.profileDiv');
const $openProfileDiv = $('.openProfileDiv');

$openProfileDiv.on('dragover dragenter',e=>{
    e.preventDefault();
    $profileDiv.addClass('show');
    $profileDiv
        .css('border-color', 'red')
        .css('background', 'lightgray');

});

$profileDiv.on('drop', e => {
    e.preventDefault();
    console.log(e);
    const files = e.originalEvent.dataTransfer.files;


    // 2. 읽은 파일 데이터를 input[type=file]태그에 저장
    const $fileInput = $('#ajax-file');
    $fileInput.prop('files', files);


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

    fetch('/ajax-upload-profile', reqInfo)
        .then(res => {
            console.log(res.status);
            return res.json();
        })
        .then(fileNames => {
            console.log(fileNames);

            // showFileData(fileNames);
        });
});

/*
function isImageFile(originFileName) {
    //정규표현식
    const pattern = /jpg$|gif$|png$/i;
    return originFileName.match(pattern);
}

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
}*/
</script>