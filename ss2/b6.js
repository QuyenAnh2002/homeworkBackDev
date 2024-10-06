let n = Number(prompt("Nhập số nguyên N: "));

let sum = 1;

for(let i = 2; i <= n; i ++){
    sum = sum + 1 / (i ** 3);

}
console.log(sum.toFixed(5));