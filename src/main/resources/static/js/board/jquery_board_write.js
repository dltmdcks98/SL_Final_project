$(document).ready(function () {
    const $fileDiv = document.querySelector('.fileDiv');
    const $fileInput = document.querySelector('.fileInput');



    // 파일을 올릴때마다 증가
    $fileDiv.addEventListener('div', e=> {
        e.target.setAttribute('size', e.target.value.length+1);
    })

    // 현재 문제 : 파일 업로드 할 경우 한번당 하나의 배열로 생성이 된다 그래서 각각 x버튼을 못주고있음
    // 삭제를 해도 히든에 남아있어서 삭제가안됨 -> if문으로 deleteImg하지않은 파일만 전송 이런식으로 하고 싶음


    function isImageFile(originFileName) {
        //정규표현식
        const pattern = /jpg$|gif$|png$/i;
        return originFileName.match(pattern);
    }

    // 파일의 확장자에 따른 렌더링 처리
    function checkExtType(fileName) {

        let originFileName = fileName.substring(fileName.indexOf("_") + 1);


        // hidden input을 만들어서 변환파일명을 서버로 넘김
        const $hiddenInput = document.createElement('input');
        $hiddenInput.setAttribute('type', 'hidden');
        $hiddenInput.setAttribute('name', 'fileNames');
        $hiddenInput.setAttribute('value', fileName);

        $('#write-form').append($hiddenInput);



            
        if (isImageFile(originFileName)) {

            const $img = document.createElement('img');
            $img.classList.add('img-sizing');
            $img.setAttribute('src', '/loadFile?fileName=' + fileName);
            $img.setAttribute('alt', originFileName);

            $('.uploaded-list').append($img);
            deleteImg(fileName);

        }
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
    function deleteImg(fileName) {
        $fileDiv.addEventListener('click', e => {
            if(e.target.matches('img')) {
                console.log(fileName);
                fetch('/deleteFile?fileName='+fileName)
                    .then(res => res.text())
                    .then(satus=>{
                        console.log(satus)
                    });
                $('.uploaded-list').remove();
            }
        })
    }


    function showFileData(fileNames) {
        for (let fileName of fileNames) {
            console.log("파일", fileNames.length);
            checkExtType(fileName);
        }
    }

    const $dropBox = $('.fileDrop');

    $dropBox.on('dragover dragenter', e => {
        e.preventDefault();
        $dropBox
            .css('border-color', '#690153')
            .css('background', 'skyblue');
    });

    $dropBox.on('dragleave', e => {
        e.preventDefault();
        $dropBox
            .css('border-color', '#077133')
            .css('background', 'transparent');
    });

    $dropBox.on('drop', e => {
        e.preventDefault();
        const files = e.originalEvent.dataTransfer.files;
        e.target.setAttribute('name','imgList');
        console.log(e.target.setAttribute)
        const $fileInput = $('#ajax-file');
        $fileInput.prop('files', files);


        //  파일 데이터를 비동기 전송
        const formData = new FormData();

        for (let file of $fileInput[0].files) {
            formData.append('files', file);
            console.log(formData.append);
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

