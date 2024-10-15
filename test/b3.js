let array = [1, 2, 3, 1, 2, 3, 4, 5, 5, 6]; 
let count = {};

for (var i = 0; i < array.length; i++) {
    var num = array[i];
    if (count[num]) {
        count[num]++;
    } else {
        count[num] = 1;
    }
}

