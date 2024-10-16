import 'package:flutter/material.dart';
import 'package:Hindu_jhatka/HomePage.dart';
import 'package:Hindu_jhatka/CategoryPage.dart';
import 'package:flutter/gestures.dart';
import 'package:Hindu_jhatka/login_page.dart';
import 'package:Hindu_jhatka/My Profile/Earn Reward Page.dart';
import 'package:Hindu_jhatka/My Profile/Contact-Us.dart';
import 'package:Hindu_jhatka/My Profile/FAQ Page.dart';
import 'package:Hindu_jhatka/My Profile/Terms and Conditions Page.dart';
import 'package:Hindu_jhatka/My Profile/PRIVACY POLICY PAGE.dart';
import 'package:Hindu_jhatka/My Profile/Seller Info Page.dart';
import 'package:firebase_auth/firebase_auth.dart';


class ProfilePage  extends StatefulWidget {
  const ProfilePage ({super.key});


  @override
  State<ProfilePage > createState() => _ProfilePageState();
}


class _ProfilePageState extends State<ProfilePage > {
  @override
  int _selectedIndex = 2;
  int _currentPage = 0;
  late PageController _pageController; // Define the PageController




  void initState() {
    super.initState();
    _pageController =
        PageController(initialPage: _currentPage); // Initialize the controller
  }


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Homepage()), // Your home page
          );
          break;
        case 1:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CategoryPage()), // Category page
          );
          break;
        case 2:
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProfilePage()), // Category page
          );
          break;
      // Add other cases for additional pages
      }
    });
  }




  void _logOut(BuildContext context) async {
    // Perform logout logic, for example, Firebase sign out
    await FirebaseAuth.instance.signOut();


    // Navigate back to login screen after logging out
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()), // Replace LoginPage with your login screen
    );
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        toolbarHeight: 0, // Hidden toolbar to match the image
      ),
      body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Center(
                  child: Column(
                    children: [
                      Text(
                        "Hi, Guest",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                          children: [
                            TextSpan(text: "Please "),
                            TextSpan(
                              text: "SignUp",
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // Action to navigate to the signup screen or perform signup logic
                                  Navigator.pushNamed(
                                      context, '/signup'); // Example navigation
                                },
                            ),
                            TextSpan(text: " to enjoy your shopping"),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
                Divider(),
                _buildListItem(
                  context,
                  icon: Icons.card_giftcard,
                  title: 'Earn Rewards',
                  subtitle: 'Invite friends and earn rewards',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EarnRewardsPage()),
                    );
                  },
                ),
                _buildListItem(
                  context,
                  icon: Icons.phone,
                  title: 'Contact Us',
                  subtitle: 'Help regarding your recent purchase',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ContactUsPage()),
                    );
                  },
                ),
                _buildListItem(
                  context,
                  icon: Icons.help_outline,
                  title: 'FAQs',
                  subtitle: 'Frequently Asked Questions',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FAQPage()),
                    );
                  },
                ),
                Divider(),
                _buildListItem(
                  context,
                  icon: Icons.description_outlined,
                  title: 'Terms & Conditions',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TermsAndConditionsPage()),
                    );
                  },
                ),
                _buildListItem(
                  context,
                  icon: Icons.privacy_tip_outlined,
                  title: 'Privacy Policy',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PrivacyPolicyPage()),
                    );
                  },
                ),
                _buildListItem(
                  context,
                  icon: Icons.storefront_outlined,
                  title: 'Seller Information',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SellerInformationPage()),
                    );
                  },
                ),
                Divider(),
                _buildListItem(
                  context,
                  icon: Icons.logout,
                  title: 'LogOut',
                  onTap: () {
                    _logOut(context); // Call the log out logic
                  },
                ),
              ]
          )


      ),


      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            label: 'Profile',
          ),
        ],
        backgroundColor: Colors.purple[100],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),


    );
  }


  // A method to build each list item
  Widget _buildListItem(BuildContext context, {
    required IconData icon,
    required String title,
    String? subtitle,
    required VoidCallback onTap, // Add this parameter
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle) : null,
      onTap: onTap, // Call the onTap callback when the tile is tapped
    );
  }
}

