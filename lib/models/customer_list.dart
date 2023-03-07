class Customer {
  final int? id;
  final String? name, address, phone;

  Customer({this.id, this.name, this.phone, this.address});
}

List<Customer> customers = [
  Customer(
    id: 1,
    name: "Khách lẻ",
    phone: "Chưa cập nhật",
  ),
  Customer(
    id: 2,
    name: "Chị Hoàng Thu Thảo",
    phone: "0918238837",
  ),
  Customer(
    id: 3,
    name: "Chị Cẩm Nhung",
    phone: "0915130295",
  ),
  Customer(
    id: 4,
    name: "Anh Tuấn",
    phone: "0915130295",
  ),
  Customer(
    id: 5,
    name: "Chị Oanh",
    phone: "0987382994",
  ),
];
