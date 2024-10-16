import 'package:flutter/material.dart';


class FAQPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQs'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'Frequently Asked Questions',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            _buildFAQItem(
              context,
              question: 'How can I track my order?',
              answer:
              'You can track your order by logging into your account and visiting the "My Orders" section.',
            ),
            _buildFAQItem(
              context,
              question: 'What is the return policy?',
              answer:
              'Our return policy allows you to return products within 30 days of purchase. For more details, please visit the Return Policy page.',
            ),
            _buildFAQItem(
              context,
              question: 'How do I cancel an order?',
              answer:
              'You can cancel an order before it is shipped by visiting the "My Orders" section and clicking on "Cancel Order".',
            ),
            _buildFAQItem(
              context,
              question: 'What payment methods do you accept?',
              answer:
              'We accept all major credit cards, debit cards, and digital wallets like PayPal and Apple Pay.',
            ),
            _buildFAQItem(
              context,
              question: 'How can I contact customer support?',
              answer:
              'You can contact customer support via email at support@company.com or by phone at +123 456 7890.',
            ),
          ],
        ),
      ),
    );
  }


  // Method to build individual FAQ items
  Widget _buildFAQItem(BuildContext context, {required String question, required String answer}) {
    return ExpansionTile(
      title: Text(question, style: TextStyle(fontWeight: FontWeight.bold)),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(answer, style: TextStyle(fontSize: 16)),
        ),
      ],
    );
  }
}
