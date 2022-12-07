<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
    const $listBtn = document.getElementById('list-btn');
    const $editBtn = document.getElementById('edit-btn');
    const $delBtn = document.getElementById('del-btn');
    const $titleDiv = document.querySelector('.content-title-div');

    const fillHeart =
        '<svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">'+
            '<path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>'+
        '</svg>'

    const emptyHeart=
        '<svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">'+
            '<path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>'+
        '</svg>'

    //목록버튼
    $listBtn.onclick = e => {

        location.href = '/board?pageNum=${p.pageNum}&amount=${p.amount}';
    };
    if($editBtn) {
        //수정버튼
        $editBtn.onclick = e => {
            if ($editBtn !== null) {
                location.href = '/board/edit?boardNo=${b.boardNo}';
            }

        };
    }

    if($delBtn) {
    //삭제버튼
    $delBtn.onclick = e => {
        if ($delBtn !== null) {
            location.href = '/board/remove?boardNo=${b.boardNo}';
        }

    };
    }
    const recommendRegistURL='/ajax/recommend';

    $titleDiv.addEventListener('click',e => {
        console.log(e.target);
        console.log('버튼 클릭 이벤트 boardNo : '+${b.boardNo});
        if(e.target.matches('svg')||e.target.matches('path')||e.target.matches('div.content-title-div')){
            fetch(recommendRegistURL+'?boardNo='+${b.boardNo})
                .then(res => res.text())
                .then(result => {
                    if(result==='delete'){
                        $titleDiv.lastChild.remove();
                        $titleDiv.innerHTML+=emptyHeart;
                    }else if(result==='register'){
                        $titleDiv.lastChild.remove();
                        $titleDiv.innerHTML+=fillHeart;
                    }else {
                        alert('좋아요 표시에 실패했습니다.');
                    }
                });
        }

    });
    $(".btnRecommend").on('click', function() {
        $titleDiv.click();
    });


    function setHeart(){
        console.log(${recommendedUser});

        if(${recommendedUser}){
            $titleDiv.innerHTML+=fillHeart;
        }else{
            $titleDiv.innerHTML+=emptyHeart;
        }

    }


    (function (){
        setHeart();
    })();

</script>
