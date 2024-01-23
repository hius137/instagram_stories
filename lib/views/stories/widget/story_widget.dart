import 'package:flutter/material.dart';
import 'package:instagram_stories/views/stories/widget/video_widget.dart';

class StoryWidget extends StatelessWidget {
  final List<String> images;
  final List<String> videos;

  const StoryWidget({super.key, required this.images, required this.videos});

  @override
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: images.length + videos.length,
      itemBuilder: (context, index) {
        if (index < images.length) {
          return Image.network(images[index]);
        } else {
          return VideoWidget(videoUrl: videos[index - images.length]);
        }
      },
    );
  }
}
