import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'; // Make sure this is imported

class SmoothPageIndicatorExample extends StatelessWidget { // Renamed the class to avoid conflict
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Smooth Page Indicator")),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _controller,
              children: [
                Container(color: Colors.red),
                Container(color: Colors.blue),
                Container(color: Colors.green),
              ],
            ),
          ),
          SizedBox(height: 16),
          SmoothPageIndicator( // This refers to the one from the package
            controller: _controller,
            count: 3,
            effect: ExpandingDotsEffect(
              expansionFactor: 4,
              dotHeight: 8,
              dotWidth: 8,
              activeDotColor: Colors.blue,
              dotColor: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SmoothPageIndicatorExample(), // Use the renamed class here
  ));
}
