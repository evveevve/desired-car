import 'package:flutter/material.dart';

class VideoController extends ValueNotifier<int> {
  VideoController.initialize(int index) : super(index);
  static final _shared = VideoController.initialize(0);
  factory VideoController() => _shared;
  final List<String> paths = [
    'assets/home_clips/mclaren-1.mp4',
    'assets/home_clips/mclaren-2.mp4',
    'assets/home_clips/mclaren-3.mp4',
    'assets/home_clips/mclaren-4.mp4',
    'assets/home_clips/mclaren-5.mp4',
  ];

  void setPath(int indx) {
    print("setting the name");
    value = indx;
    notifyListeners();
  }

  get getValue => value;
// void setPath(String name) {
  //   print("setting the name");
  //   switch (name) {
  //     case "mclaren-1":
  //       value = paths[0];
  //       break;
  //     case "mclaren-2":
  //       value = paths[1];
  //       break;
  //     case "mclaren-3":
  //       value = paths[2];
  //       break;
  //     case "mclaren-4":
  //       value = paths[3];
  //       break;
  //     case "mclaren-5":
  //       value = paths[4];
  //       break;
  //     default:
  //       value = paths[0];
  //   }
  //   notifyListeners();
  // }
  //
}
