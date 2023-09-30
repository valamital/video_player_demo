import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_demo/pages/video_item.dart';
import '../utils/string_constants.dart';

class VideoPlayerScreen extends StatelessWidget {
  /// video url list
  final List<String> urls = [
    "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
    "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
    "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
    "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"
  ];

  VideoPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConstants.appTitle),
      ),
      body: ListView.separated(
        shrinkWrap: true,
        cacheExtent: 1000,
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        addAutomaticKeepAlives: true,
        itemCount: urls.isEmpty ? 0 : urls.length,
        itemBuilder: (BuildContext context, int index) => VideoItem(
          videoPlayerController: VideoPlayerController.networkUrl(
            Uri.parse(urls[index]),
          ),
        ),
        separatorBuilder: (context, index) {
          return const Divider();
        },
      ),
    );
  }
}
