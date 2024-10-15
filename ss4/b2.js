
function check(string1, string2 ){
    let sumS = [];
    for(let i = 0; i < string1.length; i++){

        for(let j = i; j < string1.length; j++){
            sumS.push(string1.substring(i, j+1));
        }
    }

    for (let i = 0; i < sumS.length; i++){
        if(sumS[i] === string2){
            console.log(`${sumS[i]} \n True`);
            break;
        }
        else{
            console.log(`Fasle`)
        }
    }
}


let str1 = prompt("Nhập vào chuỗi 1");
let str2 = prompt("Nhập vào chuỗi 2");

check(str1, str2)