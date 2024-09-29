let year = Number(prompt("Nhập số năm: "))
let month = Number(prompt("Nhập số tháng: "))


if(month <= 12){
    if (month === 1 || month === 3 || month === 5 || month === 7 || month === 8 || month === 10 || month === 12 ){
        alert("Tháng " + month+  " có 31 ngày. Năm bạn vừa nhập là: " + year)
    }
    else if (month === 4 || month === 6 || month === 9 || month === 11 ){
        alert("Tháng " + month+  " có 30 ngày. Năm bạn vừa nhập là: " + year)
    }
    
    else{
        if (year % 4 === 0){
            if (year % 100 === 0){
                if(year % 400 === 0){
                    alert("Tháng " + month+  " có 29 ngày. Năm bạn vừa nhập là: " + year)
                }
                else{
                    alert("Tháng " + month+  " có 28 ngày. Năm bạn vừa nhập là: " + year)
                }
        
            }
            else{
                alert("Tháng " + month+  " có 29 ngày. Năm bạn vừa nhập là: " + year)
            }
        }
        
        else{
            alert("Tháng " + month+  " có 28 ngày. Năm bạn vừa nhập là: " + year)
        }
    }
}

else{
    alert("Không có tháng" + month)
}



