import 'package:flutter/material.dart';
import 'package:Hindu_jhatka/InputField.dart';
import 'Button.dart';

class Inputwrapped extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        children: <Widget>[
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              //color: Colors.white, // borderRadius: BorderRadius.circular(20)
            ),
            child: Inputfield(),
          ),
          SizedBox(height: 20,),
          Text(
            "Forgot Password?",
            style: TextStyle(color: Colors.black,fontWeight:
            FontWeight.bold,fontSize: 20)),
           Text ("SignUp", style: TextStyle(color: Colors.red,fontWeight:
           FontWeight.bold,fontSize: 20)
          ),
          SizedBox(height: 30),
          Button(),
        ],
      ),
    );
  }
}
