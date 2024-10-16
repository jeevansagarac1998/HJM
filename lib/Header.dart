import 'package:flutter/material.dart';


class Header extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
           Center(
             child: Image.asset("assets/HJM_logo-removebg-preview.png"),
           ),
           SizedBox(height: 20),
          // Center(
          //   child: Text("",style: TextStyle(color: Colors.teal[700],fontSize: 25, fontWeight: FontWeight.bold),),
          // )
        ],
      ),
    );
  }
}
