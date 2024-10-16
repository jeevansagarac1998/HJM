import 'package:flutter/material.dart';
import 'package:Hindu_jhatka/HomePage.dart';
import 'package:Hindu_jhatka/Profilepage.dart';
import 'package:Hindu_jhatka/Categories_tab/ChickenPage.dart';
import 'package:Hindu_jhatka/Categories_tab/MuttonPage.dart';
import 'package:Hindu_jhatka/Categories_tab/FishPage.dart';
import 'package:Hindu_jhatka/Categories_tab/PrawnPage.dart';
import 'package:Hindu_jhatka/Categories_tab/EggPage.dart';
import 'package:Hindu_jhatka/Categories_tab/PorkPage.dart';
import 'package:Hindu_jhatka/ProductList.dart';


class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<bool> _isExpanded = [false, false, false, false, false, false];

  int _selectedIndex = 1;
  int _currentPage = 0;


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Homepage()), // Your home page
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
            MaterialPageRoute(builder: (context) => ProfilePage()), // Category page
          );
          break;
      // Add other cases for additional pages
      }

    });
  }


  final List<Map<String, dynamic>> productlist = [
    {
      'image': 'assets/Chicken/Chicken-Lollipop-300x169.jpg',
      'title': 'Chicken',
      'description': 'Raised on biosecure farms',
      'products': [
        {'name': 'Currys Cuts', 'image': 'assets/Chicken/Chicken-barbecue cut.jpg'},
        {'name': 'Boneless Chicken', 'image': 'assets/Chicken/Chicken-barbecue cut.jpg'},
        {'name': 'Special Cuts', 'image': 'assets/Chicken/Chicken-Wings.jpg'},
      ]
    },
    {
      'image': 'assets/Mutton/Goat-Shoulder-Curry-Cut-300x169.jpg',
      'title': 'Mutton',
      'description': 'Freshly marinated meats',
      'products': [
        {'name': 'Chop Cuts', 'image': 'assets/Mutton/Mutton-Brain.jpg'},
        {'name': 'Boneless', 'image': 'assets/Mutton/Mutton-Soup-Bones.jpg'},
        {'name': 'Legs', 'image': 'assets/Mutton/Mut fresh.jpg'},
      ]
    },
    {
      'image': 'assets/SeaFood/catla-300x169.jpg',
      'title': 'Fish',
      'description': 'Fish & Seafood',
      'products': [
        {'name': 'Fresh Water', 'image': 'assets/SeaFood/roopchand-300x169.jpg'},
        {'name': 'Sea Water', 'image': 'assets/SeaFood/mackerel-300x169.jpg'},
      ]
    },
    {
      'image': 'assets/SeaFood/farm-prawn-300x169.jpg',
      'title': 'Prawn',
      'description': 'Pasture raised lamb & goats',
      'products': [
        {'name': 'Small Prawn', 'image': 'assets/SeaFood/Small_Prawn.jpeg'},
        {'name': 'Medium Prawn', 'image': 'assets/SeaFood/Medium_Prawn.jpeg'},
        {'name': 'Large Prawn', 'image': 'assets/SeaFood/Big_Prawn.jpeg'},
      ]
    },
    {
      'image': 'assets/Eggs/Farm-Eggs.jpg',
      'title': 'Eggs',
      'description': 'Rich & flavourful cuts of liver, kidney, Paya & more',
      'products': [
        {'name': 'Farm Egg', 'image': 'assets/Eggs/768px-Giriraja_eggs.jpg'},
        {'name': 'Nati Egg', 'image': 'assets/Eggs/Egg_pro-removebg-preview.png'},
        {'name': 'Giriraja Double Egg', 'image': 'assets/Eggs/Farm-Eggs.jpg'},
      ]
    },
    {
      'image': 'assets/Pork/Pork-Without-Bone-300x169.jpg',
      'title': 'Pork',
      'description': 'Cleaned, peeled & deveined',
      'products': [
        {'name': 'Curry Cuts', 'image': 'assets/Pork/Bacon-300x169.jpg'},
        {'name': 'Boneless & Mince', 'image': 'assets/Pork/Pork-Mince-300x169.jpg'},
        {'name': 'Speciality Cuts', 'image': 'assets/Pork/Pork-Without-Bone-300x169.jpg'},
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Categories'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: productlist.length,
          itemBuilder: (context, index) {
            return CategoryItem(
              imageUrl: productlist[index]['image']!,
              title: productlist[index]['title']!,
              description: productlist[index]['description']!,
              isExpanded: _isExpanded[index],
              products: productlist[index].containsKey('products')
                  ? List<Map<String, String>>.from(productlist[index]['products'])
                  : [],
              onTap: () {
                setState(() {
                  _isExpanded[index] = !_isExpanded[index];
                });
              },
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
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
}

class CategoryItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final bool isExpanded;
  final List<Map<String, String>> products;
  final VoidCallback onTap;

  CategoryItem({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.isExpanded,
    required this.products,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                imageUrl,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 6.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Icon(isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down),
          ],
        ),
      ),
    ),
    if (isExpanded)
    Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: GridView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3,
    crossAxisSpacing: 10,
    mainAxisSpacing: 10,
    childAspectRatio: 0.8,
    ),
    itemCount: products.length,
    itemBuilder: (context, index) {
    final product = products[index];
    return GestureDetector(
    onTap: () {
    // Navigate based on product name
    if (product['name'] == 'Currys Cuts') {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ChickenPage(selectedCategory: 'Currys Cuts')), // Navigate to Curry Cuts page
    );
    } else if (product['name'] == 'Boneless Chicken') {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ChickenPage(selectedCategory: 'Boneless Chicken')), // Navigate to Boneless & Mince page
    );
    } else if (product['name'] == 'Special Cuts') {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ChickenPage(selectedCategory: 'Special Cuts')), // Navigate to Speciality Cuts page
    );
    }
    if (product['name'] == 'Chop Cuts') {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => MuttonPage(selectedCategory: 'Chop Cuts')), // Navigate to Curry Cuts page
    );
    } else if (product['name'] == 'Boneless') {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => MuttonPage(selectedCategory: 'Boneless')), // Navigate to Boneless & Mince page
    );
    } else if (product['name'] == 'Legs') {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => MuttonPage(selectedCategory: 'Legs')), // Navigate to Speciality Cuts page
    );
    }
    if (product['name'] == 'Fresh Water') {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => FishPage(selectedCategory: 'Fresh Water')), // Navigate to Curry Cuts page
    );
    } else if (product['name'] == 'Sea Water') {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => FishPage(selectedCategory: 'Sea Water')), // Navigate to Boneless & Mince page
    );
    }
    if (product['name'] == 'Small Prawn') {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => PrawnPage(selectedCategory: 'Small Prawn')), // Navigate to Boneless & Mince page
    );
    }else if (product['name'] == 'Medium Prawn') {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => PrawnPage(selectedCategory: 'Medium Prawn')), // Navigate to Boneless & Mince page
    );
    }
    else if (product['name'] == 'Large Prawn') {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => PrawnPage(selectedCategory: 'Large Prawn')), // Navigate to Speciality Cuts page
    );
    }
    if (product['name'] == 'Farm Egg') {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => EggPage(selectedCategory: 'Farm Egg')), // Navigate to Curry Cuts page
    );
    } else if (product['name'] == 'Nati Egg') {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => EggPage(selectedCategory: 'Nati Egg')), // Navigate to Boneless & Mince page
    );
    } else if (product['name'] == 'Giriraja Double Egg') {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => EggPage(selectedCategory: 'Giriraja Double Egg')), // Navigate to Speciality Cuts page
    );
    }
    if (product['name'] == 'Curry Cuts') {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => PorkPage(selectedCategory: 'Curry Cuts')), // Navigate to Curry Cuts page
    );
    } else if (product['name'] == 'Boneless & Mince') {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => PorkPage(selectedCategory: 'Boneless & Mince')), // Navigate to Boneless & Mince page
    );
    } else if (product['name'] == 'Speciality Cuts') {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => PorkPage(selectedCategory: 'Speciality Cuts')), // Navigate to Speciality Cuts page
    );
    }
    },
    child: Column(
    children: [
    ClipRRect(
    borderRadius: BorderRadius.circular(40.0),
    child: Image.asset(
    product['image']!,
    width: 60,
    height: 60,
    fit: BoxFit.cover,
    ),
    ),
    SizedBox(height: 4.0),
    Text(
    product['name']!,
    style: TextStyle(fontSize: 12.0),
    textAlign: TextAlign.center,
    ),
    ],
    ),
    );
    },
    ),
    ),
    ],
    );
    }
}
