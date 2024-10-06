let inputNumber = Number(prompt("Nhập số nguyên N: "))
let reversed = 0;

while (inputNumber > 0){
    let lastDigit = inputNumber % 10; 
    reversed = reversed * 10 + lastDigit;
    inputNumber = Math.floor(inputNumber / 10);
    console.log(reversed);
}
