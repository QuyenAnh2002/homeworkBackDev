
let a = Number(prompt("Nhap diem toan"))
let b = Number(prompt("Nhap diem van"))
let c = Number(prompt("Nhap diem anh"))
let average;

if ((a > 10 || b > 10 || c > 10) || (a < 0 || b < 0 || c < 0) ){
    alert("Bạn đã nhập sai số điểm.")
}

else{
   
    average = (a + b + c) / 3;
    if (average <= 10 && average >= 8.0){
        alert("Bạn đã xếp loại Giỏi ")
    }

    else if (average <= 7.9 && average >= 6.5){
        alert("Bạn đã xếp loại Khá ")
    }
    else if (average <= 6.4 && average >= 5.0){
        alert("Bạn đã xếp loại Trung Bình ")
    }
    else{
        alert("Bạn đã xếp loại Yếu")
    }
}