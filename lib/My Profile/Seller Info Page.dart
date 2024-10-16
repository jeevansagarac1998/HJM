import 'package:flutter/material.dart';


class SellerInformationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seller Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'About the Seller',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'We are a trusted online marketplace committed to providing top-quality products to our customers. Our mission is to ensure customer satisfaction with every purchase.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Contact Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone'),
              subtitle: Text('''+91 984585632
+91 9686526328'''),
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('Email'),
              subtitle: Text('seller@company.com'),
            ),
            // ListTile(
            //   leading: Icon(Icons.location_on),
            //   title: Text('Address'),
            //   subtitle: Text('123 Marketplace Ave, City, Country'),
            // ),
            SizedBox(height: 16),
            Text(
              'Business Policies',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              '1. Return Policy: Customers can return products within 30 days of delivery for a full refund or exchange.\n'
                  '2. Shipping Information: We offer free shipping on orders over \$50. Standard shipping times apply.\n'
                  '3. Payment Methods: We accept all major credit cards, PayPal, and other popular payment methods.\n'
                  '4. Customer Support: Our support team is available 24/7 to assist with any issues or inquiries.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Seller Ratings',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            _buildRatingCard(context, 'Customer Service', 4.5),
            _buildRatingCard(context, 'Product Quality', 4.8),
            _buildRatingCard(context, 'Shipping Time', 4.7),
            SizedBox(height: 16),
            Text(
              'Get in Touch',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'If you have any questions about your order or our products, please don’t hesitate to contact us at the provided email or phone number. We’re here to help!',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }


  // Method to build a card for seller ratings
  Widget _buildRatingCard(BuildContext context, String title, double rating) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(Icons.star, color: Colors.yellow),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        trailing: Text(
          rating.toString(),
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
