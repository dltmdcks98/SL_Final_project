function appendPageActive() {

    const curPageNum = '${pageMaker.page.pageNum}';
    console.log("현재페이지: ", curPageNum);


    const $ul = document.querySelector('.pagination');

    for (let $li of [...$ul.children]) {
        if (curPageNum === $li.dataset.pageNum) {
            $li.classList.add('active');
            break;
        }
    }

}

// 옵션태그 고정
function fixSearchOption() {
    const $select = document.getElementById('search-type');

    for (let $opt of [...$select.children]) {
        if ($opt.value === '${s.type}') {
            $opt.setAttribute('selected', 'selected');
            break;
        }
    }
}

(function () {
    appendPageActive();
    fixSearchOption();
})();
