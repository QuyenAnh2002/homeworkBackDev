let phone = [
    {
     id: 1,
     name: "iphone 11",
     price: 2000000, 
    },
    {
        id: 2,
        name: "iphone 12",
        price: 5000000, 
    },
    {
        id: 3,
        name: "iphone 5",
        price: 300000, 
    },
    {
        id: 4,
        name: "iphone 15 promax 1tb",
        price: 70000000, 
    }
 ]

phone.sort(function(a, b) {
    return a.price - b.price; 
});

console.log(phone);

