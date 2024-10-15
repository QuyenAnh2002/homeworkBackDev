function check(year){
    if (year % 4 === 0){
        if (year % 100 === 0){
            if(year % 400 === 0){
                return true;
            }
            else{
                return false;
            }
    
        }
        else{
            return true;
        }
    }
    
    else{
        return false;
    }
}


let day = +prompt("Nhập ngày: ");
let month = +prompt("Nhập tháng: ");
let year = +prompt("Nhập năm: ");
let daycheck = 0;


if(month <= 12){
    if (month === 1 || month === 3 || month === 5 || month === 7 || month === 8 || month === 10 || month === 12 ){
        daycheck = 31;
    }
    else if (month === 4 || month === 6 || month === 9 || month === 11 ){
        daycheck = 30;
    }
    
    else{
        if(check(year) === true){
            daycheck = 29;
        }
        else{
            daycheck = 28;
        }
    }
}

else{
    console.log("Tháng không hợp lệ");
}

if(day <= daycheck){
    console.log(` bạn vừa nhập ngày ${day} tháng ${month} năm ${year}. Đây là ngày hợp lệ`)
}

else{
    console.log("Ngày không hợp lệ");
}

if(day === daycheck){

    let nextDay = 1;
    let newMonth = 1;
    if (month === 12){
        console.log(`Ngày tiếp theo là ngày ${nextDay} tháng ${newMonth} năm ${year + 1}`);
    }
    else{
        console.log(`Ngày tiếp theo là ngày ${nextDay} tháng ${month + 1} năm ${year}`);
    }
    
}
else{
    console.log(`Ngày tiếp theo là ngày ${day + 1} tháng ${month + 1} năm ${year}`);
}