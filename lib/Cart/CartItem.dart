class CartItem {
  int productId;
  String productName;
  double price;
  int quantity;

  CartItem({
    required this.productId,
    required this.productName,
    required this.price,
    required this.quantity,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      productId: json['productId'],
      productName: json['productName'],
      price: json['price'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
    'productId': productId,
    'productName': productName,
    'price': price,
    'quantity': quantity,
    };
    }
}
