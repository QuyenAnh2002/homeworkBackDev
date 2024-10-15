let randomNumber = 0;
function randomId(randomNumber){
    randomNumber = Math.floor(Math.random() * 100000);
    return randomNumber;
}
function isValidEmail(email) {
    var regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return regex.test(email);
}


let loot = true;

while(loot = true){
    let userInputName = prompt("Nhập tên người dùng");
    let userInputEmail = prompt("Nhập email");
    let userInputPassword = prompt("Nhập password");
    if(userInputName.length === 0 || userInputName.length < 3 || userInputEmail.length === 0 || userInputPassword.length === 0 || userInputPassword.length < 8 || isValidEmail(userInputEmail) === false){
        alert("Không hợp lệ")
    
    }
    
    else{
        let user = [
            {
                id: randomId(randomNumber),
                user_name: userInputName,
                email: userInputEmail,
                password: userInputPassword,
            }
        ]
        console.log(user)
    }
    
}




