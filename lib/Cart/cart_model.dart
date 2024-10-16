import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  // List to hold the items added to the cart
  final List<String> _cartItems = [];

  List<String> get cartItems => _cartItems;

  // Function to add an item to the cart
  void addItem(String item) {
    _cartItems.add(item);
    notifyListeners();  // Notify listeners to rebuild widgets that depend on the cart
  }

  // Function to remove an item from the cart
  void removeItem(String item) {
    _cartItems.remove(item);
    notifyListeners();
  }

  // Get total items in the cart
  int get totalItems => _cartItems.length;
}
