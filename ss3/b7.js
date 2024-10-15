let inputUser = prompt("");
let sumS = [];

for(let i = 0; i < inputUser.length; i++){

    for(let j = i; j < inputUser.length; j++){
        sumS.push(inputUser.substring(i, j+1));
    }
}

console.log(sumS);