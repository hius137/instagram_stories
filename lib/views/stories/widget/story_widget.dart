import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:instagram_stories/commons/app_images.dart';
import 'package:instagram_stories/commons/app_text_styles.dart';
import 'package:instagram_stories/models/enum/story_type.dart';
import 'package:instagram_stories/models/story_model.dart';
import 'package:instagram_stories/views/stories/story_page_vm.dart';
import 'package:instagram_stories/views/stories/widget/video_widget.dart';

class StoryWidget extends StatelessWidget {
  final List<Story> story;
  final StoryPageVM vm;

  const StoryWidget({super.key, required this.story, required this.vm});

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
                      onPageChanged: vm.onChangePage,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: story.length,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: double.infinity,
                              child: buildPageViewItem(story[index]),
                            ),
                            Positioned(
                              right: 0,
                              child: GestureDetector(
                                onTap: () {
                                  logic.pageStoryController?.nextPage(
                                      duration: const Duration(milliseconds: 500),
                                      curve: Curves.easeInOut);
                                },
                                child: Container(
                                  width: 100,
                                  height: MediaQuery.of(context).size.height,
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              child: GestureDetector(
                                onTap: () {
                                  logic.pageStoryController?.previousPage(
                                      duration: const Duration(milliseconds: 500),
                                      curve: Curves.easeInOut);
                                },
                                child: Container(
                                  width: 100,
                                  height: MediaQuery.of(context).size.height,
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  buildProgressBar(
                    story.length,
                    logic.currentIndex,
                    logic.controller,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
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
                        const SizedBox(width: 10),
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

  Widget buildProgressBar(int totalStories, int curlIndex,
      AnimationController animationController) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalStories,
        (index) => Expanded(
          child: buildSingleProgress(index, curlIndex, animationController),
        ),
      ),
    );
  }

  Widget buildSingleProgress(
      int index, int curIndex, AnimationController animationController) {
    // return LinearProgressIndicator(
    //   value: animationController.value,
    //   semanticsLabel: 'Linear progress indicator',
    // );

    return AnimatedContainer(
      height: 5,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: index == curIndex ? Colors.blue : Colors.white,
      ),
      duration: const Duration(seconds: 1),
      // Provide an optional curve to make the animation feel smoother.
      curve: Curves.easeInOut,
    );
  }
}
