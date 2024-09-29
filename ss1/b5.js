let a = Number(prompt("Nhập số a: "));
let b = Number(prompt("Nhập số b: "));
let c = Number(prompt("Nhập số c: "));

let one, two, three;

if (a >= b && a >= c) {
    one = a;
    if (b <= c) {
        two = b;
        three = c;
    } else {
        two = c;
        three = b;
    }
} else if (b >= a && b >= c) {
    one = b;
    if (a <= c) {
        two = a;
        three = c;
    } else {
        two = c;
        three = a;
    }
} else {
    one = c;
    if (a <= b) {
        two = a;
        three = b;
    } else {
        two = b;
        three = a;
    }
}

console.log(`3 số a, b, c là: ${a}, ${b}, ${c}`);
console.log(`3 số a, b, c theo thứ tự tăng dần là: ${two}, ${three}, ${one}`);
