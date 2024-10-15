
var array = [1, 2, 3, 4, 5, 6, 7]; 
var target = 8; 

function findSmallestSubarray(arr, num) {
    var minLength = Infinity;
    var start = 0; 
    var sum = 0; 
    var result = []; 

    for (var end = 0; end < arr.length; end++) {
        sum += arr[end];

        while (sum > num) {
            if (end - start + 1 < minLength) {
                minLength = end - start + 1; 
                result = arr.slice(start, end + 1); 
            }
            sum -= arr[start];
            start++;
        }
    }

    return result; 
}

var resultArray = findSmallestSubarray(array, target);
console.log(resultArray);
