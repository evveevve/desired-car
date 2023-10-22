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
              builder: (context, value, child) {
                print("path provided");
                return Transform.scale(
                    scale: 1, child: PlayVideo(asset: value));
              })
          : Container(
              height: size.height,
              width: size.width,
              color: Colors.black,
              child: Stack(
                children: [
                  Transform.scale(
                    scale:
                        //  (10-size.width*0.01).abs(),
                        2.5,
                    child: Center(
                      child: AspectRatio(
                          aspectRatio: 16 / 9,
                          child: ValueListenableBuilder(
                              valueListenable: VideoController(),
                              builder: (context, value, child) {
                                print("path provided");
                                return PlayVideo(asset: value);
                              })),
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
                          )
                              .animate(delay: const Duration(seconds: 1))
                              .fadeIn()
                              .slideY()
                              .then()
                              .shake(),
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
                            )
                                .animate(delay: const Duration(seconds: 1))
                                .fadeIn()
                                .slideY(end: 1),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: size.height * 0.1,
                                left: size.width * 0.05,
                                right: size.width * 0.05),
                            child: Text(
                              "Unlocking the Secrets to Your Dream Car.",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(197, 220, 220, 220),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ValueListenableBuilder(
                      valueListenable: ColorController(),
                      builder: (context, color, child) => Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              color,
                              Colors.transparent,
                            ],
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: const DisplaySlider()
                              .animate(delay: const Duration(seconds: 1))
                              .fadeIn()
                              .then()
                              .shimmer(),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
