import 'package:flutter/material.dart';
//import 'package:jala/Products_data/products_list.dart';
import 'package:Hindu_jhatka/Products/Pork Products.dart';


class Porkcategory extends StatefulWidget {
  final String PorkCategoryName;


  // Constructor to initialize BestSellingcategoryName
  const Porkcategory({Key? key, required this.PorkCategoryName}) : super(key: key);


  @override
  State<Porkcategory> createState() => _PorkcategoryState();
}


class _PorkcategoryState extends State<Porkcategory> {








  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: <Widget>[
              Text('Pork')
              // Text(widget.PorkCategoryName), // Access categoryName here
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
          child : Scrollbar(
            thumbVisibility: true,
            child: GridView.builder(
              itemCount: productPork.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 40.0,
              ),
              itemBuilder: (context, index) {
                return Container(
                  width: 200.0,
                  height: 10.0,
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
                            productPork[index]['image']!,
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
                                "${productPork[index]['price']}",
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
                          "${productPork[index]['itemName']}",
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
                                "${productPork[index]['itemDescription']}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                ),
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
        )
    );
  }
}
