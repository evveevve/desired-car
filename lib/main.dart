import 'package:desired_car/core/controllers/color_controller.dart';
import 'package:desired_car/data/data.dart';
import 'package:desired_car/screens/landing_page.dart';
import 'package:flutter/material.dart';
import 'helper_functions/format_brands.dart';
// import 'package:flutter_animate/flutter_animate.dart';

void main() {
  runApp(const DesiredCar());
}

class DesiredCar extends StatelessWidget {
  const DesiredCar({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ColorController(),
      builder: (context, color, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Desired Car",
        theme: ThemeData.light().copyWith(
          useMaterial3: true,
          colorScheme:
              ColorScheme.fromSeed(seedColor: ColorController().getColor()),
        ),
        home: LandingPage(),
      ),
    );
  }
}
