import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class PlayVideo extends StatefulWidget {
  const PlayVideo({super.key, required this.asset});
  final String asset;
  @override
  State<PlayVideo> createState() => _PlayVideoState();
}

class _PlayVideoState extends State<PlayVideo> {
  late VideoPlayerController _controller;

  late Size size;
  late VideoPlayer video = VideoPlayer(_controller);

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.asset)
      ..initialize().then((_) {
        setState(() {
          _controller
            ..play()
            ..setLooping(true);
        });
      });
  }

  @override
  void didUpdateWidget(PlayVideo oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.asset != oldWidget.asset) {
      _controller = VideoPlayerController.asset(widget.asset)
        ..initialize().then((_) {
          setState(() {
            _controller
              ..play()
              ..setLooping(true);
          });
        });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return video;
  }
}





// import 'package:video_player/video_player.dart';
// import 'package:flutter/material.dart';
// // import 'package:carousel_slider/carousel_slider.dart';

// class PlayVideo extends StatefulWidget {
//   const PlayVideo({super.key});

//   @override
//   State<PlayVideo> createState() => _PlayVideoState();
// }

// class _PlayVideoState extends State<PlayVideo> {
//   late VideoPlayerController _controller;

//   final List<String> videoAssets = [
//     'assets/home_clips/mclaren-1.mp4',
//     'assets/home_clips/mclaren-2.mp4',
//     'assets/home_clips/mclaren-3.mp4',
//     'assets/home_clips/mclaren-4.mp4',
//     'assets/home_clips/mclaren-5.mp4',
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.asset(videoAssets[0])
//       ..initialize().then((_) {
//         setState(() {});
//       });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // print(MediaQuery.of(context).size.width);
//     String change = videoAssets[0].replaceAll('mp4', 'jpg');
//     change = change.replaceAll('home_clips', 'home_images');
//     return
//         //  AspectRatio(
//         //   aspectRatio: 16 / 9,
//         //   child:
//         !_controller.value.isInitialized
//             ? Image.asset(
//                 'assets/home_images/mclaren-1.jpg',
//               )
//             : Stack(
//                 children: [
//                   VideoPlayer(_controller),
//                   Align(
//                     alignment: Alignment.centerRight,
//                     child: Padding(
//                       padding: MediaQuery.of(context).size.width > 600
//                           ? const EdgeInsets.only(right: 100)
//                           : const EdgeInsets.only(right: 50),
//                       child: InkWell(
//                         onTap: () {
//                           setState(() {
//                             if (_controller.value.isPlaying) {
//                               _controller.pause();
//                             } else {
//                               _controller.play();
//                             }
//                           });
//                         },
//                         child: Icon(
//                           _controller.value.isPlaying
//                               ? Icons.pause_circle_outline
//                               : Icons.play_circle_outlined,
//                           color: const Color.fromARGB(58, 163, 181, 255),
//                           size: MediaQuery.of(context).size.width > 600
//                               ? 100
//                               : 50,
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//                 // ),
//               );
//   }
// }
