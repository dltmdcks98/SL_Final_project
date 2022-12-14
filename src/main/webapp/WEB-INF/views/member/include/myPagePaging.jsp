<script>
  //현재 위치한 페이지에 active 스타일 부여하기
  function appendPageActive() {

    // 현재 내가 보고 있는 페이지 넘버
    const curPageNum = '${myBoardPageMaker.page.pageNum}';
    console.log("현재페이지: ", curPageNum);

    // 페이지 li태그들을 전부 확인해서
    // 현재 위치한 페이지 넘버와 텍스트컨텐츠가 일치하는
    // li를 찾아서 class active 부여
    const $ul = document.querySelector('.pagination');

    for (let $li of [...$ul.children]) {
      if (curPageNum === $li.dataset.pageNum) {
        $li.classList.add('active');
        break;
      }
    }

  }

  (function (){
    appendPageActive();
  })();

</script>