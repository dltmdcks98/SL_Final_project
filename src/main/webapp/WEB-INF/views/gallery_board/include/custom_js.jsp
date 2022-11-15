<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script>
    let counter = 0;

    const $container = $('.grid');
    const $status = $('#status');
    const $progress = $('progress');

    let supportsProgress = $progress[0] &&
        // IE does not support progress
        $progress[0].toString().indexOf('Unknown') === -1;

    let loadedImageCount, imageCount;

    let $masonry = $('.grid').masonry({
        columnWidth: '.grid-sizer',
        itemSelector: '.item',
        percentPosition: true,
        gutter: 20
    });


    document.addEventListener('scroll', async () =>{
        if($(window).scrollTop() == $(document).height() - $(window).height() && counter <= 10){
            counter++;
            console.log(counter);

            $masonry.masonryImagesReveal( await getItems(counter));
        }
    });



    $.fn.masonryImagesReveal = function ( $items ) {
        let msnry = this.data('masonry');
        let itemSelector = msnry.options.itemSelector;
        // hide by default
        $items.hide();
        // append to container
        this.prepend( $items );
         $items.imagesLoaded().progress( function( imgLoad, image ) {
            let $item = $( image.img ).parents( itemSelector );
            let $img = $(image.img).parent();
            $img.removeClass('is-loading');
             if ( !image.isLoaded ) {
                 $img.addClass('is-broken');
             }
             $item.show();
             msnry.appended( $item );
             // update progress element
             loadedImageCount++;
             updateProgress( loadedImageCount );
        }
        ).always( onAlways );

        imageCount = $container.find('img').length;
        resetProgress();
        updateProgress( 0 );
        return this;
    };
    // triggered after each item is loaded

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
        const response = await fetch('/ajax-gallery?num='+num);
        const data = await response.json();

        return data;
    }


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
            '<button class="js-button btn btn-secondary-outline center-block" data-toggle="modal" data-target="#modalPicture" value="Expand photo" data-url="'+url+'">Expand photo</button>'+
            '</div>'+

            '<img src="'+url+'" onerror="this.style.display=`none`"/>'+
            '</a>';
        return item;
    }
    function onError(_img){
        _img.classList('is-broken');
    }
    function resetProgress() {
        $status.css({ opacity: 1 });
        loadedImageCount = 0;
        if ( supportsProgress ) {
            $progress.attr( 'max', imageCount );
        }
    }

    function updateProgress( value ) {
        if ( supportsProgress ) {
            $progress.attr( 'value', value );
        } else {
            // if you don't support progress elem
            $status.text( value + ' / ' + imageCount );
        }
    }


    function onAlways() {
        $status.css({ opacity: 0 });
    }





    (async () => {
        $masonry.masonryImagesReveal( await getItems(counter) );
        counter++;
        $masonry.masonryImagesReveal( await getItems(counter) );
        counter++;
    })();
</script>