let a = Number(prompt("Nhap canh a: "))
let b = Number(prompt("Nhap canh b: "))

let c = Number(prompt("Nhap canh c: "))

if (((a + b) > c) || ((a + c) > b)  || ((c + b) > a) ){
    console.log("Đây là 1 tam giác hợp lệ")
}

else{
    console.log("Đây là 1 tam giác không hợp lệ")
}