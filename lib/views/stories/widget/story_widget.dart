import 'package:flutter/material.dart';
import 'package:instagram_stories/views/stories/widget/video_widget.dart';

class StoryWidget extends StatelessWidget {
  final List<String> data;


  const StoryWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: data.length,
      itemBuilder: (context, index) {
        return buildPageViewItem(data[index]);
      },
    );
  }

  Widget buildPageViewItem(String item) {
    if(item.endsWith(".jpeg")) {
      return buildImageViewer(item);
    }else{
      return VideoWidget(videoUrl: item);
    }
  }

  Widget buildImageViewer(String imageUrl) {
    return Image.network(
      imageUrl,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return child;
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
