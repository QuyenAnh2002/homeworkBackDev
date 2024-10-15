
var array1 = ["z", "z"];
var array2 = [1, 2, 3, 2, 1];
var array3 = [1, 2, 3, 4];

function isArraySymmetric(arr) {
    var length = arr.length;

    for (var i = 0; i < Math.floor(length / 2); i++) {
        if (arr[i] !== arr[length - 1 - i]) {
            return false; 
        }
    }
    
    return true; 
}

console.log(isArraySymmetric(array1));  
console.log(isArraySymmetric(array2));
console.log(isArraySymmetric(array3));  
