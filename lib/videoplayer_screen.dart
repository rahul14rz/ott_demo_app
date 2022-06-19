import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({Key? key, required this.videoUrl}) : super(key: key);

  final String videoUrl;

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  //late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    /* _controller = VideoPlayerController.network(
      widget.videoUrl,
    )..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      }); */
  }

  @override
  void dispose() {
    // _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top:35.0),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: BetterPlayer.network(
              widget.videoUrl,
              betterPlayerConfiguration: BetterPlayerConfiguration(
                
              ),
            ),
          ),
        ),
      ),
    );
  }
}
