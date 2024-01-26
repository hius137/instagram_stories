import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_stories/models/enum/story_type.dart';
import 'package:instagram_stories/models/story_model.dart';
import 'package:instagram_stories/views/stories/story_page_vm.dart';
import 'package:instagram_stories/views/stories/widget/video_widget.dart';

class StoryWidget extends StatefulWidget {
  final List<Story> story;

  const StoryWidget({super.key, required this.story});

  @override
  State<StoryWidget> createState() => _StoryWidgetState();
}

class _StoryWidgetState extends State<StoryWidget> {
  StoryPageVM vm = Get.put<StoryPageVM>(StoryPageVM());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StoryPageVM>(builder: (logic) {
      return PageView.builder(
        controller: vm.pageController,
        onPageChanged: vm.onChangePage,
        physics: const BouncingScrollPhysics(),
        itemCount: widget.story.length,
        itemBuilder: (context, index) {
          return buildPageViewItem(widget.story[index]);
        },
      );
    });
  }

  Widget buildPageViewItem(Story story) {
    switch (story.storyType) {
      case StoryType.image:
        return buildImageViewer(
          story.url,
        );
      case StoryType.video:
        return VideoWidget(
          videoUrl: story.url,
        );
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
