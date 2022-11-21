/*
*   태그 JS
*
*/


const $orange = '#fd7e14';
const $indigo = '#6610f2';
const $red ='#dc3545';
const $teal = '#20c997';
let count = 0;

const tagInput = "<input class=\"tagInput\" name=\"tag\" type=\"text\" placeholder=\"태그를 입력해주세요!\">";
const $tagDiv = document.querySelector('.tagDiv');
const $tagInput = document.querySelector('.tagInput');
$tagDiv.addEventListener('input',e=>{
    console.log('input test ');
    e.target.setAttribute('size',e.target.value.length+1);
});

$tagDiv.addEventListener('keyup',e =>{
    e.stopPropagation();
    if(e.key=='Enter'){
        createTag(e);
    }

});

function createTag(e){
    const $tagInput = document.querySelector('.tagInput');
    let tagText = e.target.value;
    console.log(tagText);

    $tagInput.setAttribute('value',tagText);
    $tagInput.setAttribute('disabled','true');
    setColor($tagInput);
    $tagInput.classList.add('tagList');
    $tagInput.classList.remove('tagInput');

    $tagDiv.innerHTML+=tagInput;
    const $newTag = $tagDiv.lastChild;
    $newTag.focus();
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