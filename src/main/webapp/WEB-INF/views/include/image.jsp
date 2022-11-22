<script>
    const $block = document.querySelector('.block');
    <%--const URL = '/ajax-gallery/search-tag?tag=${hotTagList[0].tagValue}';--%>
    /*<img src="/img/img01.jpg" alt="Sample Article">*/
    const URL = '/ajax-gallery/index';


    function getImg(){
        fetch(URL)
            .then(res => res.json())
            .then(urls => {
                console.log(urls);
                for(let i=0; i< urls.length;i++){
                    // let url = urls.get(i);
                    $block.innerHTML+='<img src="'+urls[i]+'" onerror="this.style.display=`none`"/>';
                }

            });
    }
    (function (){
        getImg();
    })();
</script>