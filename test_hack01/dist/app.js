"use strict";
class Person {
    constructor(id, name, email, phone) {
        this._id = id;
        this._name = name;
        this._email = email;
        this._phone = phone;
    }
    getName() {
        return this._name;
    }
    getId() {
        return this._id;
    }
    getDetail() {
        return `ID: ${this._id}, Name: ${this._name}, Email: ${this._email}, Phone: ${this._phone}`;
    }
}
class Room {
    constructor(roomId, type, pricePerNight, isAvailable = true) {
        this._roomId = roomId;
        this._type = type;
        this._pricePerNight = pricePerNight;
        this._isAvailable = isAvailable;
    }
    bookRoom() {
        this._isAvailable = false;
    }
    releaseRoom() {
        this._isAvailable = true;
    }
}
class StandardRoom extends Room {
    constructor(roomId, pricePerNight) {
        super(roomId, "Standard", pricePerNight);
    }
    calculateCost(nights) {
        return this._pricePerNight * nights;
    }
    getAdditionalServices() {
        return [];
    }
    applyDiscount(discountRate) {
        return this._pricePerNight * (1 - discountRate / 100);
    }
    getCancellationPolicy() {
        return "Hoàn lại 100% nếu hủy trước 1 ngày.";
    }
}
class DeluxeRoom extends Room {
    constructor(roomId, pricePerNight) {
        super(roomId, 'Deluxe', pricePerNight);
    }
    calculateCost(night) {
        return this._pricePerNight * night;
    }
    getAdditionalServices() {
        return ['Có dịch vụ ăn sáng'];
    }
    applyDiscount(discountRate) {
        return this._pricePerNight * (1 - discountRate / 100);
    }
    getCancellationPolicy() {
        return "Hoàn lại 50% nếu hủy trước 2 ngày";
    }
}
class SuiteRoom extends Room {
    constructor(roomId, pricePerNight) {
        super(roomId, 'Suite', pricePerNight);
    }
    calculateCost(night) {
        return this._pricePerNight * night;
    }
    getAdditionalServices() {
        return ['spa', 'minibar'];
    }
    applyDiscount(discountRate) {
        return this._pricePerNight * (1 - discountRate / 100);
    }
    getCancellationPolicy() {
        return "Không hoàn lại tiền nếu hủy";
    }
}
class Booking {
    constructor(bookingId, customer, room, night, totalCost) {
        this._bookingId = bookingId;
        this._customer = customer;
        this._room = room;
        this._nights = night;
        this._totalCost = totalCost;
    }
    getDetails() {
        return `Booking ID: ${this._bookingId},
     Customer: ${this._customer.getName()},
      Room Type: ${this._room._type},
       Nights: ${this._nights},
        Total Cost: ${this._totalCost.toFixed(2)}`;
    }
}
class HotelManager {
    constructor() {
        this.rooms = [];
        this.bookings = [];
        this.customers = [];
    }
    addRoom(type, pricePerNight) {
        const roomId = this.rooms.length + 1;
        let room;
        switch (type) {
            case "Standard":
                room = new StandardRoom(roomId, pricePerNight);
                break;
            case "Deluxe":
                room = new DeluxeRoom(roomId, pricePerNight);
                break;
            case "Suite":
                room = new SuiteRoom(roomId, pricePerNight);
                break;
            default:
                console.log("Không có hạng phòng phù hợp");
        }
    }
    addCustomer(name, email, phone) {
        const customerId = this.customers.length + 1;
        const customer = new Person(customerId, name, email, phone);
        this.customers.push(customer);
        return customer;
    }
    bookRoom(customerId, roomId, nights) {
        const customer = this.customers.find(c => c.id === customerId);
        const room = this.rooms.find(r => r._roomId === roomId);
        if (!customer)
            throw new Error("Customer not found");
        if (!room)
            throw new Error("Room not found");
        if (!room._isAvailable)
            throw new Error("Room is not available");
        room.bookRoom();
        const bookingId = this.bookings.length + 1;
        const totalCost = room.calculateCost(nights);
        const booking = new Booking(bookingId, customer, room, nights, totalCost);
        this.bookings.push(booking);
        return booking;
    }
    releaseRoom(roomId) {
        const room = this.rooms.find(r => r.roomId === roomId);
        if (!room) {
            throw new Error("Room not found");
        }
        room.releaseRoom();
    }
    listAvailableRooms() {
        const availableRooms = this.rooms.filter(r => r.isAvailable);
        console.log("Available Rooms: ", availableRooms);
    }
    listBookingsByCustomer(customerId) {
        const bookings = this.bookings.filter(b => b.customer.getId() === customerId);
        console.log("Bookings by Customer: ", bookings);
    }
}
class Main {
    constructor() {
        this.hotelManager = new HotelManager();
    }
    start() {
        let exit = false;
        while (!exit) {
            console.log(`

1. Thêm khách hàng
2. Thêm phòng
3. Đặt phòng
4. Trả phòng
5. Hiển thị danh sách phòng còn trống
6. Hiển thị danh sách đặt phòng của khách hàng
7. Tính tổng doanh thu từ các đặt phòng
8. Đếm số lượng từng loại phòng
9. Áp dụng giảm giá cho phòng
10. Hiển thị các dịch vụ bổ sung của phòng
11. Hiển thị chính sách hủy phòng
12. Thoát

            `);
            const choice = prompt("Chọn tùy chọn (1-12): ");
            switch (choice) {
                case "1":
                    const name = prompt("Nhập tên khách hàng: ");
                    const email = prompt("Nhập email: ");
                    const phone = prompt("Nhập số điện thoại: ");
                    this.hotelManager.addCustomer(name, email, phone);
                    console.log("Khách hàng đã được thêm thành công.");
                    break;
                case "2":
                    const type = prompt("Nhập loại phòng (Standard, Deluxe, Suite): ");
                    const price = prompt("Nhập giá mỗi đêm: ");
                    this.hotelManager.addRoom(type, price);
                    console.log("Phòng đã được thêm thành công.");
                    break;
                case "3":
                    const customerId = prompt("Nhập mã khách hàng: ");
                    const roomId = prompt("Nhập mã phòng: ");
                    const nights = prompt("Nhập số đêm: ");
                    try {
                        const booking = this.hotelManager.bookRoom(customerId, roomId, nights);
                        console.log("Đặt phòng thành công:", booking.getDetails());
                    }
                    catch (error) {
                        console.log(error.message);
                    }
                    break;
                case "4":
                    const releaseRoomId = prompt("Nhập mã phòng cần trả: ");
                    this.hotelManager.releaseRoom(releaseRoomId);
                    console.log("Phòng đã được trả thành công.");
                    break;
                case "5":
                    this.hotelManager.listAvailableRooms();
                    break;
                case "6":
                    break;
                case "7":
                    break;
                case "8":
                case "9":
                    break;
                case "10":
                    break;
                case "11":
                    break;
                case "12":
                    break;
                default:
                    console.log("Tùy chọn không hợp lệ, vui lòng chọn lại.");
            }
        }
    }
}
// Khởi tạo đối tượng Main và gọi hàm start
const mainApp = new Main();
mainApp.start();
