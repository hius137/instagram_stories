import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:instagram_stories/commons/app_images.dart';
import 'package:instagram_stories/commons/app_text_styles.dart';
import 'package:instagram_stories/views/stories/story_page_vm.dart';
import 'package:instagram_stories/views/stories/widget/story_widget.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> with TickerProviderStateMixin {
  StoryPageVM vm = Get.put<StoryPageVM>(StoryPageVM());
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    vm.readJsonData(2);
    vm.showProgress(this);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StoryPageVM>(builder: (logic) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 1.70,
                    child: StoryWidget(story: logic.storiesByIdUser),
                  ),
                  buildProgressBar(
                    logic.storiesByIdUser.length,
                    logic.currentIndex, logic.controller
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
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 45,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextFormField(
                      controller: textEditingController,
                      decoration: InputDecoration(
                        hintText: 'Envia uma mensagem',
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
                  const Spacer(),
                  SvgPicture.asset(
                    AppImages.icSend,
                    fit: BoxFit.scaleDown,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget buildProgressBar(int totalStories, int curlIndex, AnimationController animationController) {
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

  Widget buildSingleProgress(int index, int curIndex, AnimationController animationController) {
    return LinearProgressIndicator(
      value: animationController.value,
      semanticsLabel: 'Linear progress indicator',
    );

    // return AnimatedContainer(
    //   height: 5,
    //   margin: const EdgeInsets.symmetric(horizontal: 5),
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(3),
    //     color: index == curIndex ? Colors.blue : Colors.white,
    //   ),
    //   duration: const Duration(seconds: 1),
    //   // Provide an optional curve to make the animation feel smoother.
    //   curve: Curves.easeInOut,
    // );
  }
}
