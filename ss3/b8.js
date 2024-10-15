var array = [1, 2, 3, 1, 2, 3, 4, 5, 5, 6]; 
var count = {};

for (var i = 0; i < array.length; i++) {
    var num = array[i];
    if (count[num]) {
        count[num]++;
    } else {
        count[num] = 1;
    }
}

var uniqueElement = null;
for (var j = 0; j < array.length; j++) {
    if (count[array[j]] === 1) {
        uniqueElement = array[j];
        break; 
    }
}

if (uniqueElement !== null) {
    console.log(uniqueElement);
} else {
    console.log("Trong mảng không có phần tử độc nhất");
}
