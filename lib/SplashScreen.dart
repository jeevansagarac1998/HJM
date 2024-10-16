import 'package:flutter/material.dart';




class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _fadeAnimation;


  @override
  void initState() {
    super.initState();


    // Initialize the AnimationController and set the duration
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5), // Animation duration
    );


    // Define the fade animation
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller!);


    // Start the animation
    _controller!.forward();


    _navigateToHome();
  }


  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 5), () {}); // Splash screen delay
    Navigator.pushReplacementNamed(context, '/login'); // Navigate to login
  }


  @override
  void dispose() {
    _controller!.dispose(); // Dispose the controller when the widget is removed
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple[100],
        body: Stack(
            children: [
              Center(
                child: FadeTransition(
                  opacity: _fadeAnimation!,
                  child: Image.asset(
                    'assets/HJM_logo-removebg-preview.png',
                    width: 140,
                    height: 140,
                  ),
                ),
              ),
              Positioned(
                top: -70,
                left: -70,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(90.0), // Circular border radius
                  child: Image.asset(
                    'assets/Chicken/Chicken-Skinless-Curry-Cut-300x169.jpg',
                    width: 200,  // Increased width
                    height: 200, // Increased height
                    fit: BoxFit.cover, // Ensures the image covers the space
                  ),
                ),
              ),


              Positioned(
                top: 200,
                left: -110,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(120.0), // Circular border radius
                  child: Image.asset(
                    'assets/Chicken/Chicken-barbecue cut.jpg',
                    width: 200,  // Increased width
                    height: 200, // Increased height
                    fit: BoxFit.cover, // Ensures the image covers the space
                  ),
                ),
              ),


              Positioned(
                top: -70,
                right: -70,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(90.0), // Circular border radius
                  child: Image.asset(
                    'assets/Mutton/mutton-boti.jpg',
                    width: 200,  // Increased width
                    height: 200, // Increased height
                    fit: BoxFit.cover, // Ensures the image covers the space
                  ),
                ),
              ),


              Positioned(
                top: 450,
                right: -110,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(90.0), // Circular border radius
                  child: Image.asset(
                    'assets/SeaFood/farm-prawn-300x169.jpg',
                    width: 200,  // Increased width
                    height: 200, // Increased height
                    fit: BoxFit.cover, // Ensures the image covers the space
                  ),
                ),
              ),


              // Bottom left image
              Positioned(
                bottom: -70,
                left: -70,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(90.0), // Circular border radius
                  child: Image.asset(
                    'assets/Pork/Smoke-Pork-300x169.jpg',
                    width: 200,  // Increased width
                    height: 200, // Increased height
                    fit: BoxFit.cover, // Ensures the image covers the space
                  ),
                ),
              ),
              // Bottom right image
              Positioned(
                bottom: -70,
                right: -70,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(90.0), // Circular border radius
                  child: Image.asset(
                    'assets/SeaFood/basa-Fillets-.jpg',
                    width: 200,  // Increased width
                    height: 200, // Increased height
                    fit: BoxFit.cover, // Ensures the image covers the space
                  ),
                ),
              ),




            ]
        )
    );
  }
}
