
const $listBtn = document.getElementById('list-btn');
const $editBtn = document.getElementById('edit-btn');
const $delBtn = document.getElementById('del-btn');

// console.log($listBtn);

//목록버튼
$listBtn.onclick = e => {
    location.href = '/board?pageNum=${p.pageNum}&amount=${p.amount}';
};

//수정버튼
$editBtn.onclick = e => {
    if($editBtn!==null) {
        confirm('수정하시겠습니까?');
        location.href='/board/edit?boardNo=${b.boardNo}';
    }
};

//삭제버튼
$delBtn.onclick = e => {
    if($delBtn!==null) {
        confirm('삭제하시겠습니까?');
        location.href='/board/delete?boardNo=${b.boardNo}';
    }
};