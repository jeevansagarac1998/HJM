import 'package:flutter/material.dart';

class PrawnPage extends StatefulWidget {
  final String selectedCategory;

  PrawnPage({required this.selectedCategory});

  @override
  _PrawnPageState createState() => _PrawnPageState();
}

class _PrawnPageState extends State<PrawnPage> {
  late String selectedCategory;// Default category

  void initState() {
    super.initState();
    selectedCategory = widget.selectedCategory; // Initialize the selectedCategory
  }
  final List<Map<String, dynamic>> products = [
    {
      'category': 'Small Prawn',
      'imageUrl': 'assets/SeaFood/blue-crab-scaled.webp',
      'title': 'Chicken Curry Cut - Small Pieces',
      'description': 'Juicy bone-in & boneless chicken for delectable curries',
      'weight': '500 g | 12-18 pieces | serves 4',
      'deliveryInfo': 'Today in 90 mins',
      'price': '₹179',
      'originalPrice': '₹195',
      'discount': '8% off',
      'membershipPrice': '₹170',
    },
    {
      'category': 'Small Prawn',
      'imageUrl': 'assets/SeaFood/Whole-Prawns-46-1KG1-Customtigerprawn.jpg',
      'title': 'Chicken Curry Cut - Large Pieces',
      'description': 'Larger cuts, perfect for wholesome meals',
      'weight': '750 g | 15-20 pieces | serves 6',
      'deliveryInfo': 'Today in 90 mins',
      'price': '₹249',
      'originalPrice': '₹270',
      'discount': '7% off',
      'membershipPrice': '₹235',
    },
    {
      'category': 'Medium Prawn',
      'imageUrl': 'assets/SeaFood/Whole-Prawns-46-1KG1-Customtigerprawn.jpg',
      'title': 'Chicken Boneless - Small Pieces',
      'description': 'Boneless pieces for versatile cooking',
      'weight': '500 g',
      'deliveryInfo': 'Today in 90 mins',
      'price': '₹199',
      'originalPrice': '₹220',
      'discount': '9% off',
      'membershipPrice': '₹189',
    },
    {
      'category': 'Large Prawn',
      'imageUrl': 'assets/SeaFood/Whole-Prawns-46-1KG1-Customtigerprawn.jpg',
      'title': 'Chicken Wings - Special Cuts',
      'description': 'Perfectly cut chicken wings for grilling or frying',
      'weight': '400 g',
      'deliveryInfo': 'Today in 90 mins',
      'price': '₹159',
      'originalPrice': '₹170',
      'discount': '6% off',
      'membershipPrice': '₹149',
    },
    // Add more product data as needed
  ];

  List<Map<String, dynamic>> getFilteredProducts() {
    if (selectedCategory == 'All') {
      return products;
    }
    return products.where((product) => product['category'] == selectedCategory).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filteredProducts = getFilteredProducts();

    return Scaffold(
      appBar: AppBar(
        title: Text('Prawn'),
        backgroundColor: Colors.pink[100],
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category Buttons
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CategoryButton(
                    title: 'All',
                    isSelected: selectedCategory == 'All',
                    onTap: () {
                      setState(() {
                        selectedCategory = 'All';
                      });
                    },
                  ),
                  CategoryButton(
                    title: 'Small Prawn',
                    isSelected: selectedCategory == 'Small Prawn',
                    onTap: () {
                      setState(() {
                        selectedCategory = 'Small Prawn';
                      });
                    },
                  ),
                  CategoryButton(
                    title: 'Medium Prawn',
                    isSelected: selectedCategory == 'Medium Prawn',
                    onTap: () {
                      setState(() {
                        selectedCategory = 'Medium Prawn';
                      });
                    },
                  ),
                  CategoryButton(
                    title: 'Large Prawn',
                    isSelected: selectedCategory == 'Large Prawn',
                    onTap: () {
                      setState(() {
                        selectedCategory = 'Large Prawn';
                      });
                    },
                  ),
                ],
              ),
            ),
            // Filter and Item Count
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${filteredProducts.length} items', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.filter_list),
                    label: Text('Filters'),
                  )
                ],
              ),
            ),
            // List of Product Cards
            Column(
              children: filteredProducts.map((product) {
                return ProductCard(
                  imageUrl: product['imageUrl'],
                  title: product['title'],
                  description: product['description'],
                  weight: product['weight'],
                  deliveryInfo: product['deliveryInfo'],
                  price: product['price'],
                  originalPrice: product['originalPrice'],
                  discount: product['discount'],
                  membershipPrice: product['membershipPrice'],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryButton({
    Key? key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.pinkAccent : Colors.black,
            ),
          ),
          if (isSelected)
            Container(
              margin: EdgeInsets.only(top: 4),
              height: 2,
              width: 30,
              color: Colors.pinkAccent,
            )
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String weight;
  final String deliveryInfo;
  final String price;
  final String originalPrice;
  final String discount;
  final String membershipPrice;

  const ProductCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.weight,
    required this.deliveryInfo,
    required this.price,
    required this.originalPrice,
    required this.discount,
    required this.membershipPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(imageUrl, height: 150, fit: BoxFit.cover),
                SizedBox(height: 16),
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 8),
                Text(description),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(weight, style: TextStyle(color: Colors.grey[600])),
                    Text(deliveryInfo, style: TextStyle(color: Colors.green)),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '₹$price ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              TextSpan(
                                text: '₹$originalPrice',
                                style: TextStyle(
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(discount, style: TextStyle(color: Colors.green)),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Add'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            ),
        );
    }
}
