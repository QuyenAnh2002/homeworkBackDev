var array = [1, 2, 3, 4, 5, 6, 7, 8, 9]; 

function isPrime(num) {
    if (num <= 1) return false; 
    for (var i = 2; i <= Math.sqrt(num); i++) {
        if (num % i === 0) {
            return false; 
        }
    }
    return true;
}

function printPrimes(arr) {
    var primes = [];
    for (var i = 0; i < arr.length; i++) {
        if (isPrime(arr[i])) {
            primes.push(arr[i]); 
        }
    }
    console.log(primes.join(", "));

}
printPrimes(array);
