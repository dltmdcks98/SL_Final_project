

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
})();