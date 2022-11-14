<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script>
    const $grid = document.querySelector('.grid');


    const $masonry =$('.grid').masonry({
            columnWidth: '.grid-sizer',
            itemSelector: '.grid-item',
            percentPosition: true,
            gutter: 20


    });
    function setImg(num){


        fetch('/ajax-gallery?num='+num)
            .then(res => res.json())
            .then(urlList => {
                const elems = [];
                const fragment = document.createDocumentFragment();
                let item = "";
                for (let i = 0; i < urlList.length; i++) {
                    item = createItem(urlList[i]);
                    console.log(item);

                    const $item = $(item);
                    fragment.appendChild(item);
                    elems.push( item );
                    $masonry.append(fragment).masonry('appended', fragment).masonry();

                }
                // const $elems = $(elems);
                // $masonry.append($elems).masonry('appended', $elems);
                $masonry.masonry();
            });

    }



    // Image replacement handler
    $(document).on("click", ".js-button", function() {
        const imageSrc = $(this).parents(".grid-item").find("img").attr("src");
        $(".js-download").attr("href", imageSrc);
        $(".js-modal-image").attr("src", imageSrc);
        $(document).on("click", ".js-heart", function() {
            $(this).toggleClass("active");
        });
    });



    function createItem(url){

        const $a = document.createElement('div');
        // $a.setAttribute('href', url);
        $a.classList.add('grid-item');

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

    let counter = 0
    document.addEventListener('scroll', () =>{

        if($(window).scrollTop() == $(document).height() - $(window).height() && counter <= 10){
            counter++;
            console.log(counter);
            setImg(counter);
            $masonry.masonry();
        }
    });

    (function(){
        if($(window).scrollTop()==0){
            setImg(counter);
            counter++;
            setImg(counter);
            counter++;
            console.log($(window).scrollTop());
        }

    }());
</script>