let n = Number(prompt());
for (let i = n; i  >= 1; i--){
    let stars = '*'.repeat(i);
    console.log(stars);
}

for (let i = n; i  >= 1; i--){
    let spaces = ' '.repeat(n- i);
    let stars = '*'.repeat(i);
    console.log(spaces + stars);
}