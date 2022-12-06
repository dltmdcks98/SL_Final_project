function validateFormValue() {

    // 제목 입력태그

    const $titleInput = document.getElementById('title-input');
    let flag = false;

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
    if (!validateFormValue()) {
        return;
    }

    const $form = document.getElementById('write-form');
    $form.submit();
};


//목록버튼 이벤트
const ListBtn = document.getElementById('list_btn');
ListBtn.onclick = e => {
    location.href = '/board';
};



