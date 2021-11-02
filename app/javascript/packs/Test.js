let colors = ['blue', 'green', 'yellow', 'red'];
let button = document.getElementById("button");

button.addEventListener('click', function(){
    var rand = colors[Math.floor(Math.random() * colors.length)];
    let background = document.getElementById("background");
    background.style.background = rand;
})