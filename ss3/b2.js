let arr = [1,5,6,3,2,1,1,5,6,7];

let count = [];

let dub = [];

for (let i = 0; i < arr.length; i++){
    let found = false; 

    for(let j = 0; j < count.length; j++){
        if(count[j][0] === arr[i]){
            count[j][1]++;
            found = true;
            break;
        }
    }

    if (!found) {
        count.push([arr[i], 1]);
    }
}


for (let i = 0; i < count.length; i++) {
    if (count[i][1] >= 2) {
        dub.push(count[i][0]);  
    }
}


console.log("Các phần tử xuất hiện từ hai lần trở lên:", dub);