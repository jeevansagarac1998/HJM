import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;

  // Getter to return the total number of items in the cart
  int get totalItems => _cartItems.fold<int>(0, (sum, item) => sum + (item['quantity'] as int)); // Ensure it returns int

  void addItem(Map<String, dynamic> item) {
    // Check if the item is already in the cart
    final existingIndex = _cartItems.indexWhere((cartItem) => cartItem['product']['itemName'] == item['itemName']);

    if (existingIndex >= 0) {
      // If item already exists in cart, increment the quantity
      _cartItems[existingIndex]['quantity']++;
    } else {
      // If it's a new item, add it to the cart with a quantity of 1
      _cartItems.add({...item, 'quantity': 1});
    }

    notifyListeners();  // Notify listeners to update UI
  }

  void removeItem(int index) {
    _cartItems.removeAt(index);
    notifyListeners();  // Notify listeners to update UI
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();  // Notify listeners to update UI
  }

  double getTotalAmount() {
    return _cartItems.fold(0.0, (sum, item) {
      final price = _parsePrice(item['product']['price']);
      return sum + (price * (item['quantity'] as int)); // Ensure quantity is treated as int
    });
  }

  double _parsePrice(dynamic price) {
    if (price is double) return price; // Already double
    if (price is String) return double.tryParse(price) ?? 0.0; // Parse string to double
    return 0.0; // Default to 0.0 if conversion fails
  }
}
