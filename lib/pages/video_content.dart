import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoContent extends StatefulWidget {
  @override
  _VideoContentState createState() => _VideoContentState();
}

class _VideoContentState extends State<VideoContent> {
  VideoPlayerController playerController;
  VoidCallback listener;

  @override
  void initState() {
    super.initState();

    listener = () {
      setState(() {});
    };

    createVideo();
  }

  @override
  void deactivate() {
    playerController.setVolume(0.0);
    playerController.removeListener(listener);
    super.deactivate();
  }

  void createVideo() {
    if (playerController == null) {
      playerController = VideoPlayerController.asset('assets/videos/sdi_intro.mp4')
        ..addListener(listener)
        ..setVolume(0.0)
        ..initialize();
    } else {
      if (playerController.value.isPlaying) {
        playerController.pause();
      } else {
        playerController.initialize();
        playerController.play();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () { playerController.play(); },
      child: Center(
        child: AspectRatio(
          aspectRatio: playerController.value.aspectRatio,
          child: Container(child: (playerController != null ? VideoPlayer(playerController) : Container())),
        ),
      ),
    );
  }
}
