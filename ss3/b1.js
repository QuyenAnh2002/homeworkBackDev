let arr = [1,5,6,3,2,1,1,5,6,7];
let inputNumber = 16;

for(let i = 0; i < arr.length; i++){
    let currentSum = 0;
    let subarray = [];

    for (let j = i; j < arr.length; j++){
        currentSum += arr[j];
        subarray.push(arr[j]);

        if(currentSum === inputNumber){
            console.log(subarray);

        }

    }
}

