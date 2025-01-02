class Person {
    private _id: number;
    private _name: string;
    private _email: string;
    private _phone: string;

    constructor(id: number, name: string, email: string, phone: string){
        this._id = id;
        this._name = name;
        this._email = email;
        this._phone = phone;

    }
    public getName(): string{
       return this._name;
    }
    public getId(): number{
        return this._id;
    }

    public getDetail(): string {
        return `ID: ${this._id}, Name: ${this._name}, Email: ${this._email}, Phone: ${this._phone}`;
    }
    
 
}

abstract class Room{
    public _roomId: number;
    public _type: string;
    public _pricePerNight: number;
    public _isAvailable: boolean;

    constructor(roomId: number, type: string, pricePerNight: number, isAvailable: boolean = true) {
        this._roomId = roomId;
        this._type = type;
        this._pricePerNight = pricePerNight;
        this._isAvailable = isAvailable;
    }

    public bookRoom(): void{
        this._isAvailable = false;
    }

    public releaseRoom(): void {
        this._isAvailable = true;
    }

    public abstract calculateCost(night: number): number;
    public abstract getAdditionalServices(): string[];
    public abstract applyDiscount (discountRate: number): number;
    public abstract getCancellationPolicy(): string;
    
}




class StandardRoom extends Room {
    constructor(roomId: number, pricePerNight: number) {
        super(roomId, "Standard", pricePerNight);
    }

    public calculateCost(nights: number): number {
        return this._pricePerNight * nights;
    }

    public getAdditionalServices(): string[] {
        return []; 
    }

    public applyDiscount(discountRate: number): number {
        return this._pricePerNight * (1 - discountRate / 100);
    }

    public getCancellationPolicy(): string {
        return "Hoàn lại 100% nếu hủy trước 1 ngày.";
    }
}

class DeluxeRoom extends Room {
    constructor(roomId: number, pricePerNight: number){
        super(roomId, 'Deluxe', pricePerNight)
    }

    public calculateCost(night: number): number {
        return this._pricePerNight * night
    }

    public getAdditionalServices(): string[] {
        return ['Có dịch vụ ăn sáng']
    }

    public applyDiscount(discountRate: number): number {
        return this._pricePerNight * (1 - discountRate / 100);
    }

    public getCancellationPolicy(): string {
        return "Hoàn lại 50% nếu hủy trước 2 ngày";
    }
}

class SuiteRoom extends Room {
    constructor(roomId: number, pricePerNight: number){
         super(roomId, 'Suite', pricePerNight)
    }

    public calculateCost(night: number): number {
        return this._pricePerNight * night

    }
    public getAdditionalServices(): string[] {
        return ['spa', 'minibar']
    }

    public applyDiscount(discountRate: number): number {
        return this._pricePerNight * (1 - discountRate / 100); 
    }

    public getCancellationPolicy(): string {
        return "Không hoàn lại tiền nếu hủy"
    }
}

class Booking {
    public _bookingId: number;
    public _customer: Person;
    public _room: Room;
    public _nights: number;
    public _totalCost: number;

    constructor(bookingId: number, customer: Person, room: Room, night: number, totalCost: number){
        this._bookingId = bookingId;
        this._customer = customer;
        this._room = room;
        this._nights = night;
        this._totalCost = totalCost;
    }

    public getDetails(): string { return `Booking ID: ${this._bookingId},
     Customer: ${this._customer.getName()},
      Room Type: ${this._room._type},
       Nights: ${this._nights},
        Total Cost: ${this._totalCost.toFixed(2)}`;
}
}


class HotelManager{
    public rooms: Room[] = [];
    public bookings: Booking[] = [];
    public customers: Person[] = [];

    public addRoom(type: string, pricePerNight: number): void{
        const roomId = this.rooms.length + 1;
        let room: Room;

        switch(type){
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

    public addCustomer(name: string, email: string, phone: string): Person{
        const customerId = this.customers.length + 1;
        const customer = new Person(customerId, name, email, phone);
        this.customers.push(customer);
        return customer;

    }

    public bookRoom(customerId: number, roomId: number, nights: number): Booking {
        const customer = this.customers.find(c => c.id === customerId);
        const room = this.rooms.find(r => r._roomId === roomId);

        if (!customer) throw new Error("Customer not found");
        if (!room) throw new Error("Room not found");
        if (!room._isAvailable) throw new Error("Room is not available");

        room.bookRoom();
        const bookingId = this.bookings.length + 1;
        const totalCost = room.calculateCost(nights);
        const booking = new Booking(bookingId, customer, room, nights, totalCost);
        this.bookings.push(booking);
        return booking;
    }

    public releaseRoom(roomId: number): void {
        const room = this.rooms.find(r => r.roomId === roomId);

        if (!room) {
            throw new Error("Room not found");
        }

        room.releaseRoom();
    }

    public listAvailableRooms(): void {
        const availableRooms = this.rooms.filter(r => r.isAvailable);
        console.log("Available Rooms: ", availableRooms);
    }

    public listBookingsByCustomer(customerId: number): void {
        const bookings = this.bookings.filter(b => b.customer.getId() === customerId);
        console.log("Bookings by Customer: ", bookings);
    }


}
class Main {
    private hotelManager: HotelManager;

    constructor() {
        this.hotelManager = new HotelManager();
    }

    public start(): void {

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
                    } catch (error) {
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
