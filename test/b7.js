let bookStore = ["Tôi thấy hoa vàng trên cỏ xanh", "Đắc nhân tâm"];
let cart = [];

let behindScreen = [];
for (var i = 0; i < bookStore.length; i++) {
    behindScreen.push(bookStore[i].toLowerCase());
  };
let screen = "Danh sách sản phẩm";

for(let i = 0; i < bookStore.length; i++){
    screen +=  ` \n${bookStore[i]}`;
}

let inputUser = prompt(`${screen} \n Bạn muốn mua sản phẩm nào`).toLowerCase();


let check = behindScreen.find((element) => element === inputUser);
if (!check){
    console.log("Tên sách không hợp lệ")
}
else{
    cart.push(inputUser);

    console.log(cart)
}