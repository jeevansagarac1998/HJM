import 'package:Hindu_jhatka/Cart/CartProvider.dart';
import 'package:Hindu_jhatka/ProductList.dart';
import 'package:Hindu_jhatka/Cart/CartItem.dart';
import 'package:Hindu_jhatka/Cart/cart_Page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:Hindu_jhatka/login_page.dart';
import 'package:Hindu_jhatka/Splashscreen.dart';
import 'package:Hindu_jhatka/signupscreen.dart';
import 'package:Hindu_jhatka/HomePage.dart';
import 'package:provider/provider.dart';
import 'package:Hindu_jhatka/Cart/CartManager.dart';
import 'Cart/cart_model.dart';  // Your CartModel




Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();


  // Firebase initialization for web and mobile
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyBYrqRxJp8MIgDQzzYPmqNfLsybWgBWTbg",
        appId: "1:942268790773:web:5f02b27601e3664c4b92bc",
        messagingSenderId: "942268790773",
        projectId: "hindujhatka-ffcc1",
      ),
    );
  }

  else {
    await Firebase.initializeApp();
  }


  runApp(
    ChangeNotifierProvider(
      create: (context) => CartManager(),
      child: MyApp(),
    ),
  );
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'hindu_jhatka',
      home: SplashScreen(),

      routes: {
        '/login': (context) => Homepage(),
        '/signup': (context) => SignUpScreen(),
        '/productList': (context) => CartPage(totalAmount: 0.0),
      },


    );


  }
}