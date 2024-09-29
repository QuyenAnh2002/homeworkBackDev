let a = Number(prompt("Nhap a"));
let b = Number(prompt("Nhap b"));

let x;

if (a != 0){
    x = -(b/a);
    console.log(` Phương trình có nghiệm x = ${x}`);
}
else if (a === 0 && b != 0){
    console.log("Phương trình không có nghiệm");
}

else{
    console.log("Phương trình vô số nghiệm");
}
