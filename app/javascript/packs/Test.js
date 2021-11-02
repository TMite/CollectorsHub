let BlueMode = localStorage.getItem('BlueMode')
let button = document.querySelector('#button');

const enableBlue = () =>{
    document.body.classList.add("background-Blue");   
    localStorage.setItem('BlueMode','enabled');
};
const disableBlue = () =>{
    document.body.classList.remove("background-Blue");
    
    localStorage.setItem('BlueMode', null);
};

if(BlueMode === 'enabled')
{
    enableBlue();
}
button.addEventListener('click', function(){
    //Comment
    // var rand = colors[Math.floor(Math.random() * colors.length)];
    // let background = document.getElementById("background");
    // background.style.background = rand;
    BlueMode = localStorage.getItem('BlueMode');
    console.log('background');
    if(BlueMode !== 'enabled')
    {
        enableBlue();
    }
    else
    {
        disableBlue();
    }

})