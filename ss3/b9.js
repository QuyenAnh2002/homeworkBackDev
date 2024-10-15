var array = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3];

for (var i = array.length - 1; i > 0; i--) {
    var j = Math.floor(Math.random() * (i + 1)); 
    var temp = array[i];
    array[i] = array[j];
    array[j] = temp;
}

console.log(array);
