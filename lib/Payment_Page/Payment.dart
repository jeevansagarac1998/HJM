import 'package:flutter/material.dart';
//import 'package:Hindu_jhatka/Cart/CartManager.dart';

class PaymentPage extends StatelessWidget {
  final double totalAmount;

  const PaymentPage({Key? key, required this.totalAmount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Optional: Debug print to verify the type of totalAmount
    print("Total Amount: $totalAmount (Type: ${totalAmount.runtimeType})"); // Check the type here

    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
        backgroundColor: Colors.purple[100],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order Summary
            const Text(
              'Order Summary',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total Amount:', style: TextStyle(fontSize: 18)),
                Text('₹${totalAmount.toStringAsFixed(2)}', style: const TextStyle(fontSize: 18)), // Display as currency
              ],
            ),

            const Divider(height: 30, thickness: 1),

            // Payment Methods
            const Text(
              'Choose Payment Method',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),

            ListTile(
              leading: const Icon(Icons.account_balance_wallet, color: Colors.redAccent),
              title: const Text('Wallet'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.credit_card, color: Colors.redAccent),
              title: const Text('Credit / Debit Card'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.account_balance, color: Colors.redAccent),
              title: const Text('UPI Payment'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.money, color: Colors.redAccent),
              title: const Text('Cash on Delivery'),
              onTap: () {},
            ),

            const Spacer(),

            // Payment Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Implement payment logic
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Payment...')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple[100],
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text('Proceed to Pay', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
