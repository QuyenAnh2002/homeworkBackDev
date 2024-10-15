let nv = ["Nguyễn Văn A1", "Nguyễn Văn A2", "Nguyễn Văn A3"];

let inputUser = prompt("Vui lòng nhập kí tự r c u d").toUpperCase();


if(inputUser === "R"){
    console.log(nv)
}

else if(inputUser === "C"){
    let newNv = prompt("Nhập tên nhân viên mới:");
    nv.push(newNv);
    console.log(nv);


}

else if (inputUser === "U"){
    let updateNv = prompt("Nhập tên nhân viên cần sửa: ");
    let newUpdateNv = prompt("Nhập tên mới: ")
    let pot = nv.indexOf(updateNv);
    nv[pot] = newUpdateNv;

    console.log(nv);
}

else if(inputUser === "D"){
    let deleteNv = prompt("Nhập tên nhân viên cần xóa: ");
    let pot = nv.indexOf(deleteNv);
    nv.splice(pot, 1);

    console.log(nv);
}
else{
    alert("Vui lòng nhập kí tự chính xác ")
}