
var array = [1,2,5,3,1,2,3,6,7,2];

var count = {};

for (var i = 0; i < array.length; i++) {
    var num = array[i];
    if (count[num]) {
        count[num]++;
    } else {
        count[num] = 1;
    }
}

var uniqueElements = [];

for (var j = 0; j < array.length; j++) {
    if (count[array[j]] === 1) {
        uniqueElements.push(array[j]);
    }
}

console.log(uniqueElements);
