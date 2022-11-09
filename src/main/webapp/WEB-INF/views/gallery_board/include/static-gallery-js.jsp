<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- static js--%>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha/js/bootstrap.min.js'></script>

<script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>
<script src="https://unpkg.com/imagesloaded@4/imagesloaded.pkgd.min.js"></script>

<script src="/js/Masonry-gallery.js"></script>

<script>
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

    const url = 'https://www.googleapis.com/customsearch/v1?key=AIzaSyDR5HP1XN77UbnmTX9YFQowSvjW5Lz-YxU&cx=c0eb2a35954e0499f&q='
    let tag = '아이유';

    // fetch(url + tag)
    //     .then(res => res.json())
    //     .then(items => {
    //         let itemList = items.items;
    //         console.log(itemList[1].pagemap);
    //     console.log(itemList[0].pagemap.cse_image[0].src);
    //         for(let i=1; i<itemList.length; i++){
    //             console.log(items.items[i].pagemap.metatags);
    //         }
    //
    //     });


</script>