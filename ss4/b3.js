
var array = [-1, 2, 3, 5, -6, 4, 2, 9];

function maxSubarray(arr) {
    var maxSum = 0; 
    var currentSum = 0; 
    var start = 0; 
    var end = 0;
    var tempStart = 0; 

    for (var i = 0; i < arr.length; i++) {
        currentSum += arr[i]; 

        if (currentSum > maxSum) {
            maxSum = currentSum;
            start = tempStart;
            end = i;
        }

        if (currentSum < 0) {
            currentSum = 0;
            tempStart = i + 1;
        }
    }

    return arr.slice(start, end + 1);
}

var result = maxSubarray(array);
console.log(result);
