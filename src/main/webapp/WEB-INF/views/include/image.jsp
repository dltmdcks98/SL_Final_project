<script>
    const $block = document.querySelector('.block');
    const $hotTagImg = document.querySelector('.hotTagImg');
    const $tagsList = document.querySelector('.tags-list');
    let hotTagImg = [];

    const URL = '/ajax-gallery/index';
    function getImg(){
        fetch(URL)
            .then(res => res.json())
            .then(urls => {
                for(let i=0; i< urls.length;i++){
                    $block.innerHTML+='<img src="'+urls[i]+'" onerror="this.style.display=`none`"/>';
                }

            });
    }

    function tagListMouseOverEventHandler(){
        $tagsList.addEventListener('mouseover',e =>{
            if(e.target.matches('a')){
                const value = e.target.innerText;

                let targetImg;
                hotTagImg.forEach(item => {
                    if (item.tagName === value) {
                        targetImg = item.tagImg;
                    }
                });
                console.log(targetImg);
                $hotTagImg.style.backgroundImage='url('+targetImg+')';
                $hotTagImg.classList.add('hotTagImgShow');
            }

        });
    }
    function setTagImgUrl(){
        for(let $li of [...$tagsList.children]){
            getOneUrl($li.children[0].innerHTML);
            console.log(hotTagImg);
        }
    }

    function getOneUrl(tagValue){
        const URL = '/ajax-gallery/'+tagValue;
        fetch(URL)
            .then(res=>res.text())
            .then(getImgUrl=>{
                hotTagImg.push({
                   tagName : tagValue,
                   tagImg : getImgUrl
                });
            });
    }
    (function (){
        getImg();
        tagListMouseOverEventHandler();
        setTagImgUrl();

    })();
</script>