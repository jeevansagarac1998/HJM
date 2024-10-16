import 'package:get/get.dart';

class CartController extends GetxController {
  // Store the list of cart items
  var cartItems = <Map<String, dynamic>>[].obs;

  // Sum of total amount
  double get totalAmount =>
      cartItems.fold(0, (sum, item) => sum + (item['price'] * item['quantity']));

  // Add item to the cart
  void addItem(Map<String, dynamic> item) {
    var index = cartItems.indexWhere((element) => element['id'] == item['id']);
    if (index != -1) {
      incrementQuantity(index);
    } else {
      cartItems.add({...item, 'quantity': 1});
    }
  }

  // Increment item quantity
  void incrementQuantity(int index) {
    cartItems[index]['quantity']++;
    cartItems.refresh();
  }

  // Decrement item quantity
  void decrementQuantity(int index) {
    if (cartItems[index]['quantity'] > 1) {
      cartItems[index]['quantity']--;
    } else {
      cartItems.removeAt(index); // Remove item if quantity is zero
    }
    cartItems.refresh();
  }
}
