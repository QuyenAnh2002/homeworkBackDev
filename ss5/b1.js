
let book = [
   {
    name: "Hoàng tử bé",
    author: "antoine", 
   },
   {
    name: "Trăm năm cô đơn",
    author: "gabriel", 
   },
   {
    name: "Vũ trụ",
    author: "garl sagan", 
   },
   {
    name: "Lược sử vạn vật",
    author: "bill bryson", 
   }
]
let inputUser = prompt("").toLowerCase();

for(let index in book){
    console.log(book[index].author)
    if (inputUser === book[index].author){
        alert(book[index].name);
    }
    else{
        alert("Không tìm thấy sách");
    }
}