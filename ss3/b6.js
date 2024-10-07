let arr = [3, 8, 5, 13, 6, 12, 17, 24];

let even = []; 
let odd = []; 

for (let i = 0; i < arr.length; i++) {
    if (arr[i] % 2 === 0) {
        even.push(arr[i]);
    } else {
        odd.push(arr[i]); 
    }
}

console.log(even.concat(odd));