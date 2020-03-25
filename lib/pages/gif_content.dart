import 'package:flutter/material.dart';
import 'package:flutter_web_video_player/flutter_web_video_player.dart';

class GifContent extends StatefulWidget {
  @override
  _GifContentState createState() => _GifContentState();
}

class _GifContentState extends State<GifContent> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: WebVideoPlayer(
        src: 'assets/videos/sdi_intro.mp4',
      )
    );
  }
}
