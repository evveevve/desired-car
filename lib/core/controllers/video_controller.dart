import 'package:flutter/material.dart';

class VideoController extends ValueNotifier {
  VideoController.initialize(String path) : super(path);
  static final _shared =
      VideoController.initialize('assets/home_clips/mclaren-1.mp4');
  factory VideoController() => _shared;
  final List<String> paths = [
    'assets/home_clips/mclaren-1.mp4',
    'assets/home_clips/mclaren-2.mp4',
    'assets/home_clips/mclaren-3.mp4',
    'assets/home_clips/mclaren-4.mp4',
    'assets/home_clips/mclaren-5.mp4',
  ];


  void setPath(String name) {
    switch (name) {
      case "mclaren-1":
        value = paths[0];
        break;
      case "mclaren-2":
        value = paths[1];
        break;
      case "mclaren-3":
        value = paths[2];
        break;
      case "mclaren-4":
        value = paths[3];
        break;
      case "mclaren-5":
        value = paths[4];
        break;
      default:
        value = paths[0];
    }
    notifyListeners();
  }
}
