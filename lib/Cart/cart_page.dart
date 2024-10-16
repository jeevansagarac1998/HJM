import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Hindu_jhatka/Cart/CartManager.dart'; // Import CartManager
import 'package:Hindu_jhatka/Payment_Page/Payment.dart'; // Import PaymentPage

class CartPage extends StatefulWidget {
  final double totalAmount; // Parameter to accept the total amount

  const CartPage({Key? key, required this.totalAmount}) : super(key: key); // Use `const` where possible

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late double totalAmount; // Use `late` to initialize in `initState`

  @override
  void initState() {
    super.initState();
    totalAmount = widget.totalAmount; // Initialize from the passed widget parameter
    updateTotalAmount(); // Update the total amount initially
  }

  // Function to calculate the total amount from CartManager
  void updateTotalAmount() {
    final cartManager = Provider.of<CartManager>(context, listen: false);
    setState(() {
      totalAmount = cartManager.getTotalAmount();
    });
  }

  @override
  Widget build(BuildContext context) {
    final cartManager = Provider.of<CartManager>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: cartManager.getCartItems().isNotEmpty
          ? ListView.builder(
        itemCount: cartManager.getCartItems().length,
        itemBuilder: (context, index) {
          final item = cartManager.getCartItems()[index]['product'];
          final quantity = cartManager.getCartItems()[index]['quantity'];

          return ListTile(
            leading: Image.asset(
              item['image'],
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            title: Text(item['itemName']),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Quantity: $quantity"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        cartManager.decrementQuantity(index);
                        updateTotalAmount();
                      },
                    ),
                    Text("$quantity"),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        cartManager.incrementQuantity(index);
                        updateTotalAmount();
                      },
                    ),
                  ],
                ),
              ],
            ),
            trailing: Text("₹${item['price'] * quantity}"),
          );
        },
      )
          : const Center(
        child: Text("Your cart is empty."),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Display the total amount
            Text(
              'Total: ₹${totalAmount.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Navigate to PaymentPage with total amount
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentPage(
                      totalAmount: totalAmount, // Pass total amount to PaymentPage
                    ),
                  ),
                );
              },
              child: const Text(
                'Proceed to Payment',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
