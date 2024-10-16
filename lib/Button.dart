import 'package:flutter/material.dart';
import 'package:Hindu_jhatka/HomePage.dart';

class Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
// Navigate to the home page upon login
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Homepage()),
      );
    },
    child:
    Container(
      height: 40,
    width: 60,
    // margin: EdgeInsets.symmetric(vertical: 2, horizontal: 2),

    //decoration: BoxDecoration(
    //color: Colors.teal,
    //borderRadius: BorderRadius.circular(150),
    //),
    child: Center(
    child: Text("Login",style: TextStyle(
    color: Colors.black54,
    fontSize: 22,
    fontWeight: FontWeight.bold,
    ),),
    ),
    ),

    );
  }
}
