import 'package:flutter/material.dart';

class ColorController extends ValueNotifier<Color> {
  ColorController.initialize(Color clr) : super(clr);
  static final _shared =
      ColorController.initialize(const Color.fromRGBO(30, 170, 193, 1));
  factory ColorController() => _shared;

  // Color color;
  void setColor(int index) {
    print('Setting the name');
    switch (index) {
      case 0:
        value = const Color.fromRGBO(30, 170, 193, 1);
        break;
      case 1:
        value = const Color.fromRGBO(158, 240, 44, 1);
        break;
      case 2:
        value = const Color.fromRGBO(228, 3, 31, 1);
        break;
      case 3:
        value = const Color.fromARGB(255, 245, 57, 20);
        break;
      case 4:
        value = const Color.fromRGBO(187, 183, 196, 1);
        break;
      default:
        value = const Color.fromRGBO(30, 170, 193, 1);
    }
    notifyListeners();
  }
  // void setColor(String name) {
  //   print('Setting the name');
  //   switch (name) {
  //     case "mclaren-1":
  //       value = const Color.fromRGBO(30, 170, 193, 1);
  //       break;
  //     case "mclaren-2":
  //       value = const Color.fromRGBO(158, 240, 44, 1);
  //       break;
  //     case "mclaren-3":
  //       value = const Color.fromRGBO(228, 3, 31, 1);
  //       break;
  //     case "mclaren-4":
  //       value = const Color.fromARGB(255, 245, 57, 20);
  //       break;
  //     case "mclaren-5":
  //       value = const Color.fromRGBO(187, 183, 196, 1);
  //       break;
  //     default:
  //       value = const Color.fromRGBO(30, 170, 193, 1);
  //   }
  //   notifyListeners();
  // }

  Color getColor() => value;
}
