import 'package:carousel_slider/carousel_slider.dart';
import 'package:desired_car/core/controllers/video_controller.dart';
import 'package:flutter/material.dart';
import 'controllers/color_controller.dart';

class DisplaySlider extends StatefulWidget {
  const DisplaySlider({super.key});
  @override
  DisplaySliderState createState() => DisplaySliderState();
}

class DisplaySliderState extends State<DisplaySlider> {
  final List<String> videoAssets = VideoController()
      .paths
      .map((e) =>
          e.replaceAll("home_clips", "home_images").replaceAll(".mp4", ".jpg"))
      .toList();

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: videoAssets.length,
      itemBuilder: (context, index, realindex) =>
          buildImage(videoAssets[index]),
      options: CarouselOptions(
          height: 170,
          viewportFraction: MediaQuery.of(context).size.width > 500 ? 0.3 : 0.7,
          autoPlay: true,
          enlargeCenterPage: true,
          autoPlayInterval: const Duration(seconds: 20),
          initialPage: VideoController().paths.indexOf(VideoController().value),
          onPageChanged: (index, reason) {
            VideoController().setPath(index);
            ColorController().setColor(index);
            // String name =
            //     videoAssets[index].split('/')[2].replaceAll('.jpg', '');
            // VideoController().setPath(name);
            // ColorController().setColor(name);
          }),
    );
  }

  Widget buildImage(String path) => ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          path,
        ),
      );
}
