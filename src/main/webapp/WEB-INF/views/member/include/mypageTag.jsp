<script>
    const $popularTag = $('.popular-tag');
    const $userTag = $('.registed-tag');
    const special = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi;
  function getPopularTag(){
    const URL = '/ajax-tag/popular-tag';
    fetch(URL)
            .then(res => res.json())
            .then(tag =>{
              for(let i=0; i<tag.length;i++){
                  getOneUrl($popularTag,tag[i].tagValue);
              }
            });
  }
  function getUserTag(){
    const URL = '/ajax-tag/user-tag';
    fetch(URL)
            .then(res => res.json())
            .then(tag => {
              for(let i=0; i<tag.length;i++){
                  getOneUrl($userTag,tag[i].tagValue);
              }
            });
  }

  function getOneUrl(destination,tagValue){
      const URL = '/ajax-gallery/'+tagValue;
      fetch(URL)
          .then(res=>res.text())
          .then(getImgUrl=>{
              makeDOM(destination,tagValue,getImgUrl)
          });

  }
function makeDOM(destination,tagValue,imgUrl){
    const $destination = destination;
    let item =
        '<div class="tag-item" style="background-image: url('+imgUrl+'); background-size : cover;">';
        if(destination===$userTag){
            item+=
            '<span class="tag-item-delete" data-tag="'+tagValue+'">'+
                '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">'+
                    '<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/></svg>'+
            '</span>';
        }


        item +=
            '<div class="tag-item-value">'+tagValue+'</div>'+
        '</div>';

    $destination.append(item);


}

function eventHandler() {
      document.querySelector('.tag-contain').onclick = e => {

          if (e.target.matches('.tag-item')) {
              toGallery(e);
              e.stopPropagation();
          } else if (e.target.matches('svg') || e.target.matches('path')){

              delTag(e.target.closest('span'));
              e.stopPropagation();
          }
      };
}


function delTag(e){

    const URL = '/ajax-tag/tag-delete/'+e.dataset.tag;
    fetch(URL)
        .then(res => res.text())
        .then(result => {
            if(result==='success-delete'){
                e.parentNode.remove();
            }
        });


}

function registerTag(){
    $('.input-tag')[0].addEventListener('keyup',e=>{
        if(e.key=='Enter'){
            let inputTag = e.target.value;
            inputTag = subStringValue(inputTag);
            inputTag = subStringValue(inputTag);
            fetch('/ajax-tag/tag-regist/'+inputTag)
                .then(res => res.text())
                .then(result => {
                    if(result==='success-insert'){
                        e.target.value="";
                        getOneUrl($userTag,inputTag);
                    }else{
                        alert("관심사 등록에 실패했습니다...");
                    }
                });
        }
    });
}
function toGallery(e){
    const value = e.target.childNodes[0].dataset.tag;
    window.location.href='/gallery/search-tag?tag='+value;

}

function subStringValue(value){
      if(special.test(value)){
          return value.replace(special,"");
      }else{
          return value;
      }
}
function subEmptyString(value){
    return value.replace(' ','');
}
  (function (){
      getUserTag();
      getPopularTag();
      registerTag();
      eventHandler();
  })();
</script>