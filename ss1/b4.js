let height = Number(prompt("Hãy nhập chiều cao của bạn (m): "))
let weight = Number(prompt("Hãy nhập cân nặng của bạn (kg): "))
let BMI;

BMI = weight / (height**2);

if (BMI < 18.5){
    alert("BMI = " + BMI + "Cân nặng thấp (gầy) ")
}
else if (BMI >= 18.5 && BMI <= 24.9){
    alert("Bình thường")
}

else if(BMI >= 25 && BMI <= 29.9){
    alert("Tiền béo phi")
}

else if(BMI >= 25 && BMI <= 29.9){
    alert("Tiền béo phi")
}
 
else if(BMI >= 30 && BMI <= 34.9){
    alert("Béo phì độ 1")
}
 
else if(BMI >= 35 && BMI <= 39.9){
    alert("Béo phì độ 2")
}
 
else if(BMI >= 40){
    alert("Béo phì độ 3")
}

else{
    alert("Có gì đó sai sai")
}