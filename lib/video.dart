// import 'package:ardilla/constants/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
//
//
//
// /// Stateful widget to fetch and then display video content.
// class VideoApp extends StatefulWidget {
//   //const VideoApp({super.key});
//   const VideoApp({Key key}) : super(key: key);
//   static const routeName = '/video';
//
//   @override
//   _VideoAppState createState() => _VideoAppState();
// }
//
// class _VideoAppState extends State<VideoApp> {
//    VideoPlayerController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network(
//         'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
//       ..initialize().then((_) {
//         // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
//         setState(() {});
//       });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Video Demo',
//       home: Scaffold(
//         backgroundColor: AppColors.purpleColor,
//         body: Center(
//           child: _controller.value.isInitialized
//               ? AspectRatio(
//             aspectRatio: _controller.value.aspectRatio,
//             child: VideoPlayer(_controller),
//           )
//               : Container(),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             setState(() {
//               _controller.value.isPlaying
//                   ? _controller.pause()
//                   : _controller.play();
//             });
//           },
//           child: Icon(
//             _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//   }
// }


import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayerVideoAndPopPage extends StatefulWidget {
  const PlayerVideoAndPopPage({Key key}) : super(key: key);
  static const routeName = '/video';
  @override
  PlayerVideoAndPopPageState createState() => PlayerVideoAndPopPageState();
}

class PlayerVideoAndPopPageState extends State<PlayerVideoAndPopPage> {
   VideoPlayerController _videoPlayerController;
  bool startedPlaying = false;

  @override
  void initState() {
    super.initState();

    _videoPlayerController =
       // VideoPlayerController.asset('assets/Butterfly-209.mp4');
    VideoPlayerController.network('https://www.youtube.com/watch?v=zdE6DcU576o&pp=ygUVYnV0dGVyZmx5IHNob3J0IHZpZGVv');
    _videoPlayerController.addListener(() {
      if (startedPlaying && !_videoPlayerController.value.isPlaying) {
        Navigator.pop(context);
      }
    });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  Future<bool> started() async {
    await _videoPlayerController.initialize();
    await _videoPlayerController.play();
    startedPlaying = true;
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: FutureBuilder<bool>(
          future: started(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.data ?? false) {
              return AspectRatio(
                aspectRatio: _videoPlayerController.value.aspectRatio,
                child: VideoPlayer(_videoPlayerController),
              );
            } else {
              return const Text('waiting for video to load');
            }
          },
        ),
      ),
    );
  }
}