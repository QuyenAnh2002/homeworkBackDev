// let n  = Number(prompt("Nhập n: "))
// let A = 0;
// let B = 0;
// let C = 1;

// //tổng dãy số
// for(let i = 1; i <= n; i = i + 1){
//     A = A + i;
// }
// console.log(A);


// //Tổng bình phương
// for(let i = 1; i <= n; i = i + 1){

//     B = B + i**2;

// }
// console.log(B);

// for(let i = 2; i <= n; i = i +1){

//     C = C + 1/((i - 1)*i);

// }
 
// console.log(C); 



// //ex2
// for (i = 0; i <= n; i = i + 1){
//     if (i % 15 === 0){
//         console.log(i + " FizzBuzz");
//     }
//     else if (i % 3 === 0){
//         console.log(i + " Fizz");
//     }
//     else if (i % 5 === 0){
//         console.log(i + " Buzz");
//     }
//     else{
//         console.log(i);
//     }
// }
let n = 0;
let result = 50;
while(n != result){
    n = Number(prompt("Nhập n:"));
    if(n < result){
        alert("Small!");
    }
    else if(n > result){
        alert("Big");
    }

    else{
        alert("Bingo!!");
        break;
    }

}