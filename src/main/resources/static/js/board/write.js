function validateFormValue() {
    // 제목 입력태그

    const $titleInput = document.getElementById('title-input');
    let flag = false; // 입력 했을시 true

    console.log('t: ', $titleInput.value);

    if ($titleInput.value.trim() === '') {
        alert('제목을 입력해주세요');
    } else {
        flag = true;
    }
    return flag;
}

// 게시물 입력값 검증
const WriteBtn = document.getElementById('write_btn');

WriteBtn.onclick = e => {
    // 입력값을 제대로 채우지 않았는지 확인
    if (!validateFormValue()) {
        return;
    }

    // 필수 입력값을 잘 채웠으면 폼을 서브밋한다.
    const $form = document.getElementById('write-form');
    $form.submit();
};


//목록버튼 이벤트
const ListBtn = document.getElementById('list_btn');
ListBtn.onclick = e => {
    location.href = '/board';
};



