let n = parseInt(prompt("Nhập n: "));

if (n <= 0) {
  console.log("nhập số dương!");
} else {
  let count = 0; 
  let number = 2; 

  console.log(`Các số nguyên tố đầu tiên:`);

  while (count < n) {
    let isPrime = true; 

    for (let i = 2; i <= Math.sqrt(number); i++) {
      if (number % i === 0) {
        isPrime = false; 
        break; 
      }
    }

    if (isPrime) {
      console.log(number); 
      count++; 
    }

    number++; 
  }
}
