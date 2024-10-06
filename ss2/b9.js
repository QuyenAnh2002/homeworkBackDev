let a = parseInt(prompt("Nhập số a: "));
let b = parseInt(prompt("Nhập số b: "));
let c = parseInt(prompt("Nhập số c: "));
let d = parseInt(prompt("Nhập số d: "));

let gcd = (x, y) => {
  while (y !== 0) {
    let temp = y;
    y = x % y;
    x = temp;
  }
  return x;
};

let result = gcd(gcd(a, b), gcd(c, d));

console.log(`Ước chung lớn nhất của ${a}, ${b}, ${c}, ${d} là: ${result}`);
