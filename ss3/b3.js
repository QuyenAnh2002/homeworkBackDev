let arr = [1,2,3,4,5,7]; 
arr.sort();

let smallNumber = 1;

for (let i = 0; i < arr.length; i++) {
    if (arr[i] === smallNumber) {
        smallNumber++; 
    }
}

console.log(smallNumber);
