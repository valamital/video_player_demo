import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoItem extends StatefulWidget {
  final VideoPlayerController? videoPlayerController;

  const VideoItem({
    @required this.videoPlayerController,
    Key? key,
  }) : super(key: key);

  @override
  ListItemState createState() => ListItemState();
}

class ListItemState extends State<VideoItem> {
  ChewieController? chewieController;

  @override
  void initState() {
    super.initState();
    chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController!,
      aspectRatio: 12 / 9,
      autoInitialize: true,
      looping: true,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: const TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Chewie(
          controller: chewieController!,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.videoPlayerController!.value.isPlaying) {
      widget.videoPlayerController!.pause();
    }
    chewieController!.dispose();
    super.dispose();
  }
}
