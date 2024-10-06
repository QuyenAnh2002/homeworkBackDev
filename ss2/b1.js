let randomNumber = 0;
randomNumber = Math.floor(Math.random() * 10);
let inputNumber = 0;
while(inputNumber != randomNumber ){

    inputNumber = Number(prompt("Hãy nhập số"));
    if(inputNumber != randomNumber){
        console.log(randomNumber);
        continue;

    }
    else{
        alert("Kết quả đúng");
        console.log(randomNumber);
        break;
    }
}

console.log(randomNumber)