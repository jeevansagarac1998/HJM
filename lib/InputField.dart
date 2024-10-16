import 'package:flutter/material.dart';

class Inputfield extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SingleChildScrollView(),
        Container(
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
              border: Border(
                  bottom: BorderSide(color: Colors.black12!),
              )
          ),
          child: TextField(
            decoration: InputDecoration(
                hintText: "Enter your email",
                hintStyle: TextStyle(color: Colors.grey[500],fontSize: 20),
                border: InputBorder.none
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
              border: Border(
                  top: BorderSide(color: Colors.black12 !)
              )
          ),
          child: TextField(
            decoration: InputDecoration(
                hintText: "Enter your password",
                hintStyle: TextStyle(color: Colors.grey[500],fontSize: 20),
                border: InputBorder.none
            ),
          ),
        )
      ],
    );
  }
}
