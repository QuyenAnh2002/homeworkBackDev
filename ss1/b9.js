let year = Number(prompt("Nhập số năm: "))

if (year % 4 === 0){
    if (year % 100 === 0){
        if(year % 400 === 0){
            console.log(` năm ${year} là năm nhuận`);
        }
        else{
            console.log(` năm ${year} không phải là năm nhuận`);
        }

    }
    else{
        console.log(` năm ${year} là năm nhuận`);
    }
}

else{
    console.log(` năm ${year} không phải là năm nhuận`);
}