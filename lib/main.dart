import 'package:flutter/material.dart';
import './screens/landing_page.dart';
// import 'package:flutter_animate/flutter_animate.dart';

void main() {
  runApp(const DesiredCar());
}

class DesiredCar extends StatelessWidget {
  const DesiredCar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Desired Car",
      theme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme:const  ColorScheme.highContrastDark(),
      ),
      home: LandingPage(),
    );
  }
}
