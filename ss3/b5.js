let common = [];
let arr1 = [1, 5, 10, 20, 40, 80];
let arr2 = [6, 7, 20, 80, 100];
let arr3 = [3, 4, 15, 20, 30, 70, 80, 120];

for (let i = 0; i < arr1.length; i++) {
    for (let j = 0; j < arr2.length; j++) {
        for (let k = 0; k < arr3.length; k++) {
            if (arr1[i] === arr2[j] && arr2[j] === arr3[k]) {
                if (!common.includes(arr1[i])) {
                    common.push(arr1[i]);
                }
            }
        }
    }
}

console.log(common)