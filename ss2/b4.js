let a = 0, b = 1, sum = a + b; 
let inputNumber = Number(prompt("Nhập số nguyên N:"))
console.log("Dãy Fibonacci nhỏ hơn " + inputNumber + " là:");

console.log(a); 
console.log(b);

while(sum < inputNumber){
    let nextNumber = a + b;
    if(sum + nextNumber >= inputNumber){
        break;
    }
    console.log(nextNumber); 
    sum += nextNumber;
    a = b;  
    b = nextNumber; 
}