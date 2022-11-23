<script>
    const $popularTag = $('.popular-tag');
    const $userTag = $('.registed-tag');

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
    const item =
        '<div class="tag-item" style="background-image: url('+imgUrl+'); background-size : cover;">'+
            '<span class="tag-item-delete" onclick="delTag(this)" data-tag="'+tagValue+'">'+
                '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">'+
                '<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/></svg>'+
            '</span>'+
            '<div class="tag-item-value">'+tagValue+'</div>'+
        '</div>';

    $destination.append(item);
}
function delTag(e){
    console.log(e.dataset.tag);
    const URL = '/ajax-tag/tag-delete/'+e.dataset.tag;
    console.log(URL);

}
  (function (){
      getUserTag();
      getPopularTag();
  })();
</script>