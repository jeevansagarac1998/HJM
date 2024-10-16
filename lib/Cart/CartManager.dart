import 'package:flutter/material.dart';

class CartManager extends ChangeNotifier {
  static final CartManager _instance = CartManager._internal();
  final List<Map<String, dynamic>> _cartItems = [];

  factory CartManager() => _instance;

  CartManager._internal();

  List<Map<String, dynamic>> getCartItems() => _cartItems;

  void addToCart(Map<String, dynamic> product) {
    print(product); // Debug: Check product data structure

    final price = _parsePrice(product['price']); // Ensure proper parsing

    final existingIndex = _cartItems.indexWhere(
          (item) => item['product']['itemName'] == product['itemName'],
    );

    if (existingIndex >= 0) {
      // If product already exists in cart, increment quantity
      _cartItems[existingIndex]['quantity']++;
    } else {
      // Otherwise, add new product to cart
      _cartItems.add({
        'product': {...product, 'price': price}, // Ensure price is double
        'quantity': 1,
      });
    }
    notifyListeners(); // Notify listeners for UI update
  }

  void incrementQuantity(int index) {
    _cartItems[index]['quantity']++;
    notifyListeners();
  }

  void decrementQuantity(int index) {
    if (_cartItems[index]['quantity'] > 1) {
      _cartItems[index]['quantity']--;
    } else {
      _cartItems.removeAt(index);
    }
    notifyListeners();
  }

  double getTotalAmount() {
    return _cartItems.fold(0.0, (sum, item) {
      final price = _parsePrice(item['product']['price']);
      return sum + (price * item['quantity']);
    });
  }

// Helper function to safely parse price to double
  double _parsePrice(dynamic price) {
    if (price is double) return price; // Already double
    if (price is String)
      return double.tryParse(price) ?? 0.0; // Parse string to double safely
    return 0.0; // Default to 0.0 if conversion fails
  }
}
