let str = "this is A Test";

let words = str.split(" ");
let strOut = "";
for (let i = 0; i < words.length; i++) {
    words[i] = words[i][0].toUpperCase() + words[i].substring(1).toLowerCase();
    strOut = `${strOut} ${words[i]}`
    
}
console.log(strOut);



