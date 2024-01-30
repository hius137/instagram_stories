import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:instagram_stories/commons/app_images.dart';
import 'package:instagram_stories/commons/app_text_styles.dart';
import 'package:instagram_stories/models/enum/story_type.dart';
import 'package:instagram_stories/models/story_model.dart';
import 'package:instagram_stories/views/stories/story_page_vm.dart';
import 'package:instagram_stories/views/stories/widget/video_widget.dart';

class StoryWidget extends StatefulWidget {
  final List<Story> stories;

  const StoryWidget({super.key, required this.stories});

  @override
  State<StoryWidget> createState() => _StoryWidgetState();
}

class _StoryWidgetState extends State<StoryWidget>
    with TickerProviderStateMixin {
  StoryPageVM vm = Get.put<StoryPageVM>(StoryPageVM());
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this);
    final Story firstStory = widget.stories.first;
    _loadStory(story: firstStory, animateToPage: false);
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.stop();
        _animationController.reset();
        setState(() {
          if (vm.currentIndexStory + 1 == widget.stories.length) {
            vm.pageStoriesController?.animateToPage(
              vm.currentIndexStories + 1,
              duration: const Duration(milliseconds: 1),
              curve: Curves.easeInOut,
            );
          }
          if (vm.currentIndexStory + 1 < widget.stories.length) {
            vm.currentIndexStory += 1;
            _loadStory(story: widget.stories[vm.currentIndexStory]);
          } else {
            vm.currentIndexStory = 0;
            _loadStory(story: widget.stories[vm.currentIndexStory]);
          }
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StoryPageVM>(
      builder: (logic) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.8,
                    width: MediaQuery.of(context).size.width,
                    child: PageView.builder(
                      controller: vm.pageStoryController,
                      onPageChanged: vm.onChangePageStory,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: widget.stories.length,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: double.infinity,
                              child: buildLoadStory(widget.stories[index]),
                            ),
                            logic.currentIndexStory == widget.stories.length - 1
                                ? const SizedBox.shrink()
                                : Positioned(
                                    right: 0,
                                    child: GestureDetector(
                                      onTap: () {
                                        logic.pageStoryController?.nextPage(
                                            duration: const Duration(
                                                milliseconds: 500),
                                            curve: Curves.easeInOut);
                                        _animationController.stop();
                                        _animationController.reset();
                                      },
                                      child: Container(
                                        width: 100,
                                        height:
                                            MediaQuery.of(context).size.height,
                                        color: Colors.transparent,
                                      ),
                                    ),
                                  ),
                            logic.currentIndexStory == 0
                                ? const SizedBox.shrink()
                                : Positioned(
                                    left: 0,
                                    child: GestureDetector(
                                      onTap: () {
                                        logic.pageStoryController?.previousPage(
                                            duration: const Duration(
                                                milliseconds: 500),
                                            curve: Curves.easeInOut);
                                        _animationController.stop();
                                        _animationController.reset();
                                      },
                                      child: Container(
                                        width: 100,
                                        height:
                                            MediaQuery.of(context).size.height,
                                        color: Colors.transparent,
                                      ),
                                    ),
                                  ),
                          ],
                        );
                      },
                    ),
                  ),
                  Row(
                    children: widget.stories
                        .asMap()
                        .map((i, e) {
                          return MapEntry(
                            i,
                            AnimatedBar(
                              animationController: _animationController,
                              position: i,
                              currentIndex: logic.currentIndexStory,
                            ),
                          );
                        })
                        .values
                        .toList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 15),
                    child: Row(
                      children: [
                        Image.asset(
                          AppImages.imgAvatar,
                          width: 40,
                          height: 40,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Username',
                          style: AppTextStyle.white14Bold,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'time',
                          style: AppTextStyle.white12W,
                        ),
                        const Spacer(),
                        SvgPicture.asset(
                          AppImages.icMenuTopWhite,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 20),
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: SvgPicture.asset(
                            AppImages.icX,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 45,
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: TextFormField(
                        controller: null,
                        decoration: InputDecoration(
                          hintText: 'Envia uma mensagem',
                          hintStyle: AppTextStyle.white14W,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          border: const OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const Spacer(),
                    SvgPicture.asset(
                      AppImages.icHeart,
                      fit: BoxFit.scaleDown,
                    ),
                    const SizedBox(width: 10),
                    SvgPicture.asset(
                      AppImages.icSend,
                      fit: BoxFit.scaleDown,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildLoadStory(
    Story story,
  ) {
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

  Widget buildImageViewer(
    String imageUrl,
  ) {
    return Image.network(
      imageUrl,
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        if (frame == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        _animationController.forward();
        return child;
      },
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  void _loadStory({
    required Story story,
    bool animateToPage = true,
    bool animateToNextStories = false,
  }) {
    _animationController.stop();
    _animationController.reset();
    switch (story.storyType) {
      case StoryType.image:
        _animationController.duration = Duration(seconds: story.duration);
        break;
      case StoryType.video:
        _animationController.duration = Duration(seconds: story.duration);
        break;
    }
    if (animateToPage) {
      vm.pageStoryController?.animateToPage(
        vm.currentIndexStory,
        duration: const Duration(milliseconds: 1),
        curve: Curves.easeInOut,
      );
    }
    if (animateToNextStories) {
      vm.pageStoriesController?.animateToPage(
        vm.currentIndexStories,
        duration: const Duration(milliseconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }
}

class AnimatedBar extends StatelessWidget {
  final AnimationController animationController;
  final int position;
  final int currentIndex;

  const AnimatedBar({
    super.key,
    required this.animationController,
    required this.position,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1.5),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: <Widget>[
                _buildContainer(
                  double.infinity,
                  position < currentIndex
                      ? Colors.white
                      : Colors.white.withOpacity(0.5),
                ),
                position == currentIndex
                    ? AnimatedBuilder(
                        animation: animationController,
                        builder: (context, child) {
                          return _buildContainer(
                            constraints.maxWidth * animationController.value,
                            Colors.white,
                          );
                        },
                      )
                    : const SizedBox.shrink(),
              ],
            );
          },
        ),
      ),
    );
  }

  Container _buildContainer(double width, Color color) {
    return Container(
      height: 5.0,
      width: width,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: Colors.black26,
          width: 0.8,
        ),
        borderRadius: BorderRadius.circular(3.0),
      ),
    );
  }
}
