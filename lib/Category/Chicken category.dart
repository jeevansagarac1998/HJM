import 'package:flutter/material.dart';
import 'package:Hindu_jhatka/Products/Chicken Products.dart';


class Chickencategory extends StatefulWidget {
  final String ChickenCategoryName;


  // Constructor to initialize BestSellingcategoryName
  const Chickencategory({Key? key, required this.ChickenCategoryName}) : super(key: key);


  @override
  State<Chickencategory> createState() => _ChickencategoryState();
}


class _ChickencategoryState extends State<Chickencategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Text('Chicken')
            // Text(widget.ChickenCategoryName),
            // SizedBox(width: 100),
            // Icon(Icons.search),
            // SizedBox(width: 10),
            // Icon(Icons.favorite),
            // SizedBox(width: 10),
            // Icon(Icons.shopping_cart),
          ],
        ),
      ),
      body: Container(
        child: Scrollbar(
          thumbVisibility: true, // Makes the scrollbar always visible
          child: GridView.builder(
            itemCount: productChicken.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 30.0,
              mainAxisSpacing: 50.0,
            ),
            itemBuilder: (context, index) {
              return Container(
                width: 200.0,
                height: 4.0,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Color(0x1F000000)),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFFFD180),
                      //offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image and Price
                    Stack(
                      children: [
                        Image.asset(
                          productChicken[index]['image']!,
                          width: double.infinity,
                          height: 110,
                          fit: BoxFit.fill,
                        ),
                        Positioned(
                          right: 12,
                          bottom: 4,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            color: Colors.black.withOpacity(0.5),
                            child: Text(
                              "${productChicken[index]['price']}",
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
                        "${productChicken[index]['itemName']}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              "${productChicken[index]['itemDescription']}",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Add to cart functionality
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                            Colors.black, // Use backgroundColor instead of primary
                            padding:
                            EdgeInsets.symmetric(vertical: 3, horizontal: 10),
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
