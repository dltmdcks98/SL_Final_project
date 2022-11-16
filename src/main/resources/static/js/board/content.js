const $listBtn = document.getElementById('list-btn');
const $editBtn = document.getElementById('edit-btn');
const $delBtn = document.getElementById('del-btn');

// console.log($listBtn);

//목록버튼
$listBtn.onclick = e => {
    confirm('목록가기?');
    location.href = '/board?pageNum=${p.pageNum}&amount=${p.amount}';
};

//수정버튼
$editBtn.onclick = e => {
    confirm('수정하시겠습니까?');
    location.href='/board/edit?boardNo=${b.boardNo}';
};

//삭제버튼
$delBtn.onclick = e => {
    confirm('삭제하시겠습니까?');
    location.href='/board/delete?boardNo=${b.boardNo}';
};