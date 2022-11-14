<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script>
    let counter = 0;
    $(function() {
        let $masonry = $('.grid').masonry({
            columnWidth: '.grid-sizer',
            itemSelector: '.item',
            percentPosition: true,
            gutter: 20
        });

        $('#load-images').click( async function() {
            let $items = await getItems(counter);
            console.log("click 테스트 :" + $items);
            $masonry.masonryImagesReveal( $items );
            counter++;
        });

        // if($(window).scrollTop()==0){
        //     let $items = await getItems(0);
        //     $masonry.masonryImagesReveal($items);
        //     console.log($(window).scrollTop());
        // }


        document.addEventListener('scroll', async () =>{
            if($(window).scrollTop() == $(document).height() - $(window).height() && counter <= 10){
                counter++;
                console.log(counter);

                $masonry.masonryImagesReveal( await getItems(counter));
            }
        });
    });
    // const $grid = document.querySelector('.grid');

    $.fn.masonryImagesReveal = function( $items ) {
        let msnry = this.data('masonry');
        let itemSelector = msnry.options.itemSelector;
        // hide by default
        $items.hide();
        // append to container
        this.append( $items );
        $items.imagesLoaded().progress( function( imgLoad, image ) {
            // get item
                // image is imagesLoaded class, not <img>, <img> is image.img
            let $item = $( image.img ).parents( itemSelector );
            // un-hide item
            $item.show();
            // masonry does its thing
            msnry.appended( $item );
        });

        return this;
    };


    async function getItems(num){
        let items = '';

        // console.log(await urls(num));
        await urls(num).then(data =>{
            for(let i =0; i< data.length; i++){
                items += getItem(data[i]);
                // console.log(items);
            }
        });

        console.log("await문 나오거 : " + items);
        return $( items );
    }

    const urls = async (num) => {
        // let urls='';
        // fetch('/ajax-gallery?num='+num)
        //     .then(res => {
        //         return res.json();
        //     })
        //     .then(urlList => {
        //         // for (let i = 0; i < urlList.length; i++) {
        //         //     urls += urlList[i];
        //         // }
        //         return urlList;
        //     });
        // console.log(urls);
        // return urls;
        const response = await fetch('/ajax-gallery?num='+num);
        const data = await response.json();

        return data;
    }
    // function getItems() {
    //     var items = '';
    //     for ( var i=0; i < 12; i++ ) {
    //         items += getItem();
    //     }
    //     // return jQuery object
    //     return $( items );
    // }

    // Image replacement handler
    $(document).on("click", ".js-button", (event) => {
        const imageSrc = event.currentTarget.dataset.url;
        console.log(imageSrc);
        $(".js-download").attr("href", imageSrc);
        $(".js-modal-image").attr("src", imageSrc);
        $(document).on("click", ".js-heart", function() {
            $(this).toggleClass("active");
        });
    });



    function getItem(url){
        const item =
            '<a class="item">'+
            '<div class="item__overlay">'+
            '<button class="js-button btn btn-secondary-outline center-block" data-toggle="modal" data-target="#modalPicture" value="Expand photo" data-url="'+url+'">Expand photo</button></div>'+
            '<img src="'+url+'"/> </a>';


        return item;
    }



    $.fn.masonryImagesReveal = function( $items ) {
        var msnry = this.data('masonry');
        var itemSelector = msnry.options.itemSelector;
        // hide by default
        $items.hide();
        // append to container
        this.append( $items );
        $items.imagesLoaded().progress( function( imgLoad, image ) {
            // get item
            // image is imagesLoaded class, not <img>, <img> is image.img
            var $item = $( image.img ).parents( itemSelector );
            // un-hide item
            $item.show();
            // masonry does its thing
            msnry.appended( $item );
        });

        return this;
    };



</script>