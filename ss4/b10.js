function capitalizeLastCharacter(str) {
  
    var words = str.split(" ");
    var result = [];

    for (var i = 0; i < words.length; i++) {
        var word = words[i];
        if (word.length > 0) {
            var newWord = word.slice(0, -1) + word.charAt(word.length - 1).toUpperCase();
            result.push(newWord);
        }
    }

    return result.join(" ");
}

var input = prompt("Nhập vào một chuỗi bất kỳ: ");

var output = capitalizeLastCharacter(input);
console.log(output);
