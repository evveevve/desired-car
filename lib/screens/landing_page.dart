import 'package:desired_car/core/controllers/color_controller.dart';
import 'package:desired_car/core/playvideo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../core/display_carousel.dart';
import '../core/controllers/video_controller.dart';

class LandingPage extends StatelessWidget {
  LandingPage({super.key});
  final colors = [Colors.black, Colors.blue.shade50, Colors.pink.shade50];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: size.width > 700
          ? ValueListenableBuilder(
              valueListenable: VideoController(),
              builder: (context, value, child) =>
                  PlayVideo(asset: value))
          : Container(
              height: size.height,
              width: size.width,
              color: Colors.black,
              child: Stack(
                children: [
                  Transform.scale(
                    scale: 2.5,
                    child: Center(
                      child: AspectRatio(
                        aspectRatio: 1.5,
                        child: ValueListenableBuilder(
                            valueListenable: VideoController(),
                            builder: (context, value, child) =>
                                PlayVideo(asset: value)),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    child: Container(
                      width: size.width,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromARGB(255, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0)
                          ],
                        ),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 60,
                          ),
                          const Text(
                            "Desired Car",
                            style: TextStyle(
                                color: Color.fromARGB(218, 236, 236, 236),
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ).animate(delay: const Duration(seconds: 1))
                            ..fadeIn()
                            ..shake(),
                          ValueListenableBuilder(
                            valueListenable: ColorController(),
                            builder: (context, color, child) => Container(
                              height: 10,
                              width: 180,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                  colors: [
                                    const Color.fromARGB(44, 33, 149, 243),
                                    color,
                                    const Color.fromARGB(44, 33, 149, 243),
                                  ],
                                ),
                              ),
                            ).animate(delay: const Duration(seconds: 1))
                              ..fadeIn(),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: DisplaySlider(),
                      ))
                ],
              ),
            ),
    );
  }
}
