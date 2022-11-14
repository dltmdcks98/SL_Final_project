<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script>
    const $grid = document.querySelector('.grid');
/*    const $masonry = $('.grid').masonry({
        columnWidth: '.grid__sizer',
        itemSelector: '.grid__item',
        percentPosition: true,
        gutter: 20
    });*/

    const $masonry =$('.grid').masonry({
            columnWidth: '.grid__sizer',
            itemSelector: '.grid__item',
            percentPosition: true,
            gutter: 20
    });

    function setImg(num){

        fetch('/ajax-gallery?num='+num)
            .then(res => res.json())
            .then(urlList => {
                const elems = [];
                const fragment = document.createDocumentFragment();
                for (let i = 0; i < urlList.length; i++) {
                    const item = createItem(urlList[i]);
                    console.log(item);

                    const $item = $(item);
                    $masonry.append($item).masonry('appended',$item);

                    // fragment.appendChild(item);
                    // elems.push( item );
                }

                // const $elems = $(elems);
                // $masonry.append($elems).masonry('appended', $elems);

            });
    }



    // Image replacement handler
    $(document).on("click", ".js-button", function() {
        const imageSrc = $(this).parents(".grid__item").find("img").attr("src");
        $(".js-download").attr("href", imageSrc);
        $(".js-modal-image").attr("src", imageSrc);
        $(document).on("click", ".js-heart", function() {
            $(this).toggleClass("active");
        });
    });

    const $btn_test = document.querySelector('#btn_test');
    $btn_test.addEventListener('click',()=>{
        let elems = [ setImg(1),setImg(2),setImg(3) ];

        // make jQuery object
        var $elems = $( elems );
        $masonry.append( $elems ).masonry( 'appended', $elems );
    });

    function createItem(url){
        const $a = document.createElement('a');
        $a.setAttribute('href', '#');
        $a.setAttribute('style','display:block');

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

    function scrollGetImage(scrollTop){
        switch (scrollTop) {
            case scrollTop>200:
                setImg(2);
                break;
            case scrollTop>500:
                setImg(3);
                break;
            default:break;
        }
    }
    document.addEventListener('scroll', e =>{
        const scrollPosition = document.documentElement.scrollTop;
        const gridHieht = $grid.clientHeight;
        console.log(scrollPosition,e.deltaY,gridHieht);
    });

    (function(){
        setImg(0);
        // setImg(1);

    }());
</script>