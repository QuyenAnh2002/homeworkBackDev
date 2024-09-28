let a = Number(prompt("Nhập số a: "))
let b = Number(prompt("Nhập số b: "))
let c = Number(prompt("Nhập số c: "))

if (a >= b && a >= c){
    console.log("Số lớn nhất là: " + a)
}
else if (b >= a && b >= c){
    console.log("Số lớn nhất là: " + b)
}
else{
    console.log("Số lớn nhất là: " + c)
}