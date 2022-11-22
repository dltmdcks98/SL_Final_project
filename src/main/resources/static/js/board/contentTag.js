/*TAG*/
const $orange = '#fd7e14';
const $indigo = '#6610f2';
const $red ='#dc3545';
const $teal = '#20c997';

let count =0;
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
(function (){

    const $tagInput = document.querySelector('.tagDiv').getElementsByTagName('div');
    for(let i=0; i<$tagInput.length;i++){
        // setColor($tagInput.item(i));
    }

})();