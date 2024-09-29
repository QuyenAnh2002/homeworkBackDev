let a = Number(prompt("Nhap a: "));
let b = Number(prompt("Nhap b: "));
let c = Number(prompt("Nhap c: "));

let x;

let x1, x2;
let delta;
if (a === 0){
    x = -(b / c);
    console.log(`Phương trình có nghiệm x = ${x}`)
}
else{
    delta = Number(b ** 2 - 4 * a * c);
    if (delta > 0){
        x1 = (-b + Math.sqrt(delta)) / (2 * a);
        x2 = (-b - Math.sqrt(delta)) / (2 * a);
        console.log(`delta = ${delta} 
            a = ${a}
            b = ${b}
            c = ${c}`)
        console.log(`Phương trình có 2 nghiệm x1 = ${x1}
            x2 = ${x2}`)
    }

    else if(delta === 0){
        x = -b / (2*a);
        console.log(`delta = ${delta} 
            a = ${a}
            b = ${b}
            c = ${c}`)
        console.log(`Phương trình có nghiệm x = ${x}`)
    }
    else{
        console.log(`delta = ${delta} 
            a = ${a}
            b = ${b}
            c = ${c}`)
        console.log("Phương trình không có nghiệm")
    }

}