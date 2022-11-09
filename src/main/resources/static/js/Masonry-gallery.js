

(function() {
    const masonry = new Masonry('.grid', {
        itemSelector: '.grid__item',
        // columnWidth: 200
        columnWidth: '.grid__sizer',
        percentPosition: true,
        gutter: 20,
    });
    //이미지 로딩이 안될시 나오는 함수
    imagesLoaded('.grid').on('progress', function () {
        masonry.layout();
    });

    // Image replacement handler
    $(document).on("click", ".js-button", function() {
        var imageSrc = $(this).parents(".grid__item").find("img").attr("src");
        $(".js-download").attr("href", imageSrc);
        $(".js-modal-image").attr("src", imageSrc);
        $(document).on("click", ".js-heart", function() {
            $(this).toggleClass("active");
        });
    });


    fetch('/ajax-gallery')
        .then(res => res.json())
        .then(urlList => {
            console.log(urlList);
            for (let i = 0; i < urlList.length; i++) {
                const $a = document.createElement('a');
                $a.setAttribute('href', '#');
                $a.classList.add('grid__item');
                $('.grid').append($a);

                const $div = document.createElement('div');
                $div.classList.add('item__overlay');
                $a.append($div);

                const $button = document.createElement('button');
                $button.classList.add('js-button', 'btn', 'secondary-outline', 'center-block');
                $button.dataset.toggle = 'modal';
                $button.dataset.target = '#modalPicture';
                $button.type = 'button';
                $button.value = 'Expand photo';
                $button.innerText='Expand photo';
                $div.append($button);

                const $img = document.createElement('img');
                $img.setAttribute('src', urlList[i]);
                $a.append($img);
            }
        });
})();