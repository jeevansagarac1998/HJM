import 'package:Hindu_jhatka/Cart/cart_page.dart'; // Ensure this is correct
import 'package:flutter/material.dart';
import 'package:Hindu_jhatka/Products/Best Selling Products.dart';
import 'package:Hindu_jhatka/Cart/CartManager.dart'; // Use CartManager consistently
import 'package:provider/provider.dart';

class Bestsellingcategory extends StatefulWidget {
  final String BestsellingcategoryName;

  const Bestsellingcategory({Key? key, required this.BestsellingcategoryName}) : super(key: key);

  @override
  State<Bestsellingcategory> createState() => _BestsellingcategoryState();
}

class _BestsellingcategoryState extends State<Bestsellingcategory> {
  List<bool> isAdded = [];

  @override
  void initState() {
    super.initState();
    isAdded = List<bool>.filled(productBestSelling.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Best Selling'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // Use CartManager instead of CartProvider
              final cartManager = Provider.of<CartManager>(context, listen: false);
              final totalAmount = cartManager.getTotalAmount();

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(totalAmount: totalAmount), // Pass totalAmount here
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        child: Scrollbar(
          thumbVisibility: true,
          child: GridView.builder(
            itemCount: productBestSelling.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 30.0,
              mainAxisSpacing: 50.0,
            ),
            itemBuilder: (context, index) {
              final product = productBestSelling[index]; // Get the current product

              return Container(
                width: 200.0,
                height: 10.0,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Color(0x1F000000)),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFE1BEE7),
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Image.asset(
                          product['image']!,
                          width: double.infinity,
                          height: 110,
                          fit: BoxFit.fill,
                        ),
                        Positioned(
                          right: 12,
                          bottom: 4,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                            color: Colors.black.withOpacity(0.5),
                            child: Text(
                              "${product['price']}",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        "${product['itemName']}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                "${product['itemDescription']}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Create a product map here
                              final productToAdd = {
                                'itemName': product['itemName'],
                                'price': product['price'], // Make sure this is a double
                                'image': product['image'],
                                'itemDescription': product['itemDescription'],
                              };

                              // Add product to cart
                              final cartManager = Provider.of<CartManager>(context, listen: false);
                              cartManager.addToCart(productToAdd); // Add product to cart

                              // Optionally update UI to indicate the product has been added
                              setState(() {
                                isAdded[index] = true; // Update the state for visual feedback
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              padding: EdgeInsets.symmetric(vertical: 3, horizontal: 8),
                            ),
                            child: Text(
                              "Add to Cart",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
