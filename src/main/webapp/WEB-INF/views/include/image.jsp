<script>
    const $block = document.querySelector('.block');
    const URL = '/ajax-gallery/index';
    /*<img src="/img/img01.jpg" alt="Sample Article">*/

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