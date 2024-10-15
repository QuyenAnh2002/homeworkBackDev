var array = [4, 6, 3, 7];

function countTriangles(arr) {
    var count = 0;

    for (var i = 0; i < arr.length; i++) {
        for (var j = i + 1; j < arr.length; j++) {
            for (var k = j + 1; k < arr.length; k++) {
                var a = arr[i];
                var b = arr[j];
                var c = arr[k];

                if (a + b > c && a + c > b && b + c > a) {
                    count++; 
                }
            }
        }
    }

    return count; 
}

var result = countTriangles(array);
console.log(result);
