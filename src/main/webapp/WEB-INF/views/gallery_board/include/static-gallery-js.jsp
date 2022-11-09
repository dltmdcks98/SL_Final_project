<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- static js--%>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha/js/bootstrap.min.js'></script>

<script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>
<script src="https://unpkg.com/imagesloaded@4/imagesloaded.pkgd.min.js"></script>

<script>


    const $grid = document.querySelector('.gird');

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


</script>



<script src="/js/Masonry-gallery.js"></script>