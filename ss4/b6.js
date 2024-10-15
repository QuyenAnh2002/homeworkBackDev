function classifyCharacters(str) {
    var letters = [];
    var digits = [];
    var specials = [];

    for (var i = 0; i < str.length; i++) {
        var char = str[i];
        if (/[a-zA-Z]/.test(char)) {
            letters.push(char); 
        } else if (/\d/.test(char)) {
            digits.push(char); 
        } else {
            specials.push(char);
        }
    }

    return letters.concat(digits, specials);
}

var input = prompt("Nhập vào một chuỗi bất kỳ: ");

var result = classifyCharacters(input);
console.log(result.join(""));
