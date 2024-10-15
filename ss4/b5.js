function printOddNumbers(n) {
    var oddNumbers = [];
    var sum = 0;

    for (var i = 1; i <= n; i += 2) {
        oddNumbers.push(i);
        sum += i;
    }

    if (sum % 2 === 0 && oddNumbers.length > 0) {
        oddNumbers.pop();
    }

    console.log(oddNumbers.join(", "));
}

var input = prompt("Nhập vào một số nguyên dương: ");
var number = parseInt(input);

if (number > 0) {
    printOddNumbers(number);
} else {
    console.log("Vui lòng nhập một số nguyên dương!");
}
