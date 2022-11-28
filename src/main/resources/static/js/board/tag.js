const $orange = 'rgba(253,126,20,0.52)';
const $indigo = 'rgba(102,16,242,0.36)';
const $red ='rgba(220,53,69,0.66)';
const $teal = 'rgba(32,201,151,0.46)';

const special = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi;
let count = 0;


const $tagDiv = document.querySelector('.tagDiv');

const tagInput =
    "    <div class=\"tagDivInput tagInput\">\n" +
    "        <input type=\"text\" placeholder=\"태그를 입력해주세요!\">\n" +
    "    </div>";
const tagDeleteButton =
    '<span class="tag-item-delete">'+
    '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">'+
    '<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/></svg>'+
    '</span>';

$tagDiv.addEventListener('input',e=>{
    e.target.setAttribute('size',e.target.value.length+1);
});

$tagDiv.addEventListener('keyup',e =>{
    if(e.key=='Enter'){
        let value = e.target.value;
        value = subEmptyString(value);
        value = subStringValue(value);
        e.target.value = value;
        e.target.setAttribute('name','tagList');
        if(chkTag()){
            createTag(e);
        }
    }
});

function chkTag(){
    const tagList = document.getElementsByName('tagList');
    if(tagList.length>1){
        for(let i =1; i< tagList.length; i++){
            let tagValue = tagList[i-1].value;
            let newTagValue = tagList[i].value;
            console.log('기존 값'+tagValue);
            console.log('새로운 값'+newTagValue);
            if(tagValue===newTagValue){
                console.log('같은 값');
                tagList[i].parentElement.classList.add('warnTag');
                tagList[i].value='';

                return false;
            }
            if(tagList[i].parentElement.classList.contains('warnTag')){
                tagList[i].parentElement.classList.remove('warnTag');
            }
        }
    }
    console.log('다른 값')
    return true;
}

function createTag(e){
    const $tagInput = document.querySelector('.tagInput');
    const $tagInputBox = document.querySelector('.tagInput input');
    let tagText = e.target.value;

    $tagInputBox.setAttribute('value',tagText);
    $tagInputBox.setAttribute('readonly','true');

    setColor($tagInput);
    $tagInput.classList.add('tagList');
    $tagInput.classList.remove('tagInput');
    $tagInput.innerHTML+=tagDeleteButton;

    $tagDiv.innerHTML+=tagInput;
    $tagDiv.lastChild.children[0].focus();

}

function delTag(){
    $tagDiv.addEventListener('click',e=>{
        if(e.target.matches('path')||e.target.matches('svg')){
            console.log(e.target.closest('div').remove());

        }
    });
}

function setColor($tagInput){
    switch (count) {
        case 0:
            $tagInput.style.backgroundColor = $orange
            count++;
            break;
        case 1:
            $tagInput.style.backgroundColor =$indigo;
            count++;
            break;
        case 2:
            $tagInput.style.backgroundColor =$red;
            count++
            break;
        case 3:
            $tagInput.style.backgroundColor =$teal;
            count = 0;
            break;
        default:
            break;
    }
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
    delTag();
})();

