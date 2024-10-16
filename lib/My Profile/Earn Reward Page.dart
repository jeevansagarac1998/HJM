import 'package:flutter/material.dart';


class EarnRewardsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Earn Rewards'),
      ),
      body: Scrollbar(
        thumbVisibility: true, // Makes the scrollbar visible
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Invite Friends and Earn Rewards',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'You can earn rewards by inviting your friends to join our platform. '
                    'For each successful signup using your referral, you\'ll receive points that can be redeemed for discounts or special offers.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              ElevatedButton.icon(
                icon: Icon(Icons.share),
                label: Text('Invite Friends'),
                onPressed: () {
                  // Logic to share referral link or invite friends
                  // You can use packages like 'share' for sharing referral links
                },
              ),
              SizedBox(height: 32),
              Text(
                'Your Rewards',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              _buildRewardCard(context, '5%', 'Discount on your next purchase'),
              _buildRewardCard(context, '10%', 'Discount on orders over \$100'),
              _buildRewardCard(context, 'Free Shipping', 'On your next purchase'),
              SizedBox(height: 32),
              Text(
                'How It Works',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              _buildHowItWorksItem(Icons.group_add, 'Invite your friends via the Invite Friends button.'),
              _buildHowItWorksItem(Icons.check_circle, 'Your friends sign up using your referral link.'),
              _buildHowItWorksItem(Icons.card_giftcard, 'You earn rewards once they complete their first purchase.'),
            ],
          ),
        ),
      ),
    );
  }


  // Reward card to show individual rewards
  Widget _buildRewardCard(BuildContext context, String rewardTitle, String description) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(Icons.card_giftcard, color: Colors.purple),
        title: Text(rewardTitle, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
      ),
    );
  }


  // List item for 'How it Works' section
  Widget _buildHowItWorksItem(IconData icon, String text) {
    return ListTile(
      leading: Icon(icon, color: Colors.purple),
      title: Text(text),
    );
  }
}
