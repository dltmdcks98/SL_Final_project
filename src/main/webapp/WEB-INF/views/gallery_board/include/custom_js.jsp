<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    const $grid = document.querySelector('.grid');
    const masonry = new Masonry('.grid', {
        columnWidth: '.grid__sizer',
        itemSelector: '.grid__item',
        percentPosition: true,
        gutter: 20
    });
    //이미지 로딩이 안될시 나오는 함수
    imagesLoaded('.grid').on('progress', function () {
        masonry.layout();
    });


    fetch('/ajax-gallery')
        .then(res => res.json())
        .then(urlList => {
            // console.log(urlList); url 전달 확인
            // let elems = [];
            const fragment = document.createDocumentFragment();
            for (let i = 0; i < urlList.length; i++) {
                const item = createItem(urlList[i]);
                console.log(item);

                fragment.appendChild(item);
                // elems.push(item);
                // $grid.appendChild(item);
                // masonry.appended(item);
            }
            // console.log(elems);
            $grid.appendChild(fragment);
            masonry.appended($grid);
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


    function createItem(url){
        const $a = document.createElement('a');
        $a.setAttribute('href', '#');
        $a.classList.add('grid__item');
        // $('.grid').append($a);

        const $div = document.createElement('div');
        $div.classList.add('item__overlay');
        $a.append($div);

        const $button = document.createElement('button');
        $button.classList.add('js-button', 'btn', 'btn-secondary-outline', 'center-block');
        $button.dataset.toggle = 'modal';
        $button.dataset.target = '#modalPicture';
        $button.type = 'button';
        $button.value = 'Expand photo';
        $button.innerText='Expand photo';
        $div.append($button);

        const $img = document.createElement('img');
        $img.setAttribute('src', url);
        $a.append($img);

        return $a;
    }

</script>