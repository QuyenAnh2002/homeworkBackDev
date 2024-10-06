let studentNameList = [
    "Bùi Huy Quyền Anh",
    "Anh Huy Quyền Bùi",
    "Huy Quyền Bùi Anh",
    "Quyền Huy Anh Bùi",
];

// console.log(studentNameList[2]);

// console.log(`Danh sách học sinh: ${studentNameList}`);

// for(let i = 0; i < studentNameList.length; i = i + 1){
//     console.log(`STT ${i + 1}: ${studentNameList[i]}`);
// }


// for (let student of studentNameList){
//     console.log(`${student}`);
// }

// for (let index in studentNameList){
//     console.log(+index + 1, studentNameList[index]);
// }

// unshift() + Thêm đầu ---- push() + Thêm cuối -----  splice() + Thêm bất kì
studentNameList.unshift("Thêm vào đầu danh sách");
studentNameList.push("Thêm vào cuối danh sách");

studentNameList[2] = 'Update phần tử số 2'





// shift() + xóa đầu ---- pop() + xóa cuối -----  splice() + xóa bất kì

studentNameList.shift();
studentNameList.pop();

studentNameList.splice(2, 0, 'Phần tử số 2  mới được thêm');
console.log(studentNameList)