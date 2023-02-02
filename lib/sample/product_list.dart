class Product {
  final String? image, name, sku;
  final int? id, price, stock;

  Product({this.id, this.image, this.name, this.sku, this.price, this.stock});
}

List<Product> products = [
  Product(
    id: 1,
    image:
        "https://img.tgdd.vn/imgt/f_webp,fit_outside,quality_75,s_300x300/https://cdn.tgdd.vn/Products/Images/42/289700/s16/iPhone-14-Pro-series-%20(1)-650x650.png",
    name: "Iphone 14 pro max",
    sku: "IP-14-PRM",
    price: 30000000,
    stock: 4,
  ),
  Product(
    id: 2,
    image:
        "https://img.tgdd.vn/imgt/f_webp,fit_outside,quality_75,s_300x300/https://cdn.tgdd.vn/Products/Images/42/240259/s16/iPhone-14-thumb-topzone%20(2)-650x650.png",
    name:
        "Iphone 14 pro nhưng không max, bộ nhớ siêu khủng, 2 sim và rất nhiều thẻ nhớ, nói chung là dùng thì bao phê !!!!",
    sku: "IP-14-PM",
    price: 25000000,
    stock: 3,
  ),
  Product(
    id: 3,
    image:
        "https://img.tgdd.vn/imgt/f_webp,fit_outside,quality_75,s_300x300/https://cdn.tgdd.vn/Products/Images/44/231244/s16/macbook-air-m1-2020-silver-thumb-650x650.png",
    name: "Macbook M1 2020",
    sku: "MB-M1-2020",
    price: 32000000,
    stock: 5,
  ),
  Product(
    id: 4,
    image:
        "http://stargear.vn/uploaded_files/sanpham/36166745_B%C3%A0n%20ph%C3%ADm%20c%C6%A1%20AKKO%203098B%20Multi-modes%20Black%20Gold%201.jpg",
    name: "Akko 3098B",
    sku: "AKKO 3098B",
    price: 120000,
    stock: 4,
  ),
  Product(
    id: 5,
    image:
        "http://stargear.vn/uploaded_files/sanpham/36166745_B%C3%A0n%20ph%C3%ADm%20c%C6%A1%20AKKO%203098B%20Multi-modes%20Black%20Gold%201.jpg",
    name: "Akko 3098B",
    sku: "AKKO 3098B",
    price: 120000,
    stock: 4,
  ),
  Product(
    id: 6,
    image:
        "http://stargear.vn/uploaded_files/sanpham/36166745_B%C3%A0n%20ph%C3%ADm%20c%C6%A1%20AKKO%203098B%20Multi-modes%20Black%20Gold%201.jpg",
    name: "Akko 3098B",
    sku: "AKKO 3098B",
    price: 120000,
    stock: 4,
  ),
   Product(
    id: 7,
    image:
        "http://stargear.vn/uploaded_files/sanpham/36166745_B%C3%A0n%20ph%C3%ADm%20c%C6%A1%20AKKO%203098B%20Multi-modes%20Black%20Gold%201.jpg",
    name: "Akko 3098B",
    sku: "AKKO 3098B",
    price: 120000,
    stock: 4,
  ),
];
