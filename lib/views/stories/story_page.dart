import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:instagram_stories/commons/app_images.dart';
import 'package:instagram_stories/commons/app_text_styles.dart';
import 'package:instagram_stories/views/stories/story_page_vm.dart';
import 'package:instagram_stories/views/stories/widget/story_widget.dart';
import 'package:instagram_stories/views/stories/widget/video_widget.dart';
import 'package:video_player/video_player.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  StoryPageVM vm = Get.put<StoryPageVM>(StoryPageVM());
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StoryPageVM>(builder: (logic) {
      List<String> data = [
        "https://images.pexels.com/photos/19869392/pexels-photo-19869392.jpeg",
        "https://player.vimeo.com/external/296210754.hd.mp4?s=08c03c14c04f15d65901f25b542eb2305090a3d7&profile_id=175&oauth2_token_id=57447761",
        "https://images.pexels.com/photos/19867843/pexels-photo-19867843.jpeg",
        "https://player.vimeo.com/external/517090081.sd.mp4?s=ee697395679ffeb176703b481af4395a8ca5ff1a&profile_id=164&oauth2_token_id=57447761",
        "https://images.pexels.com/photos/19855379/pexels-photo-19855379.jpeg",
        "https://player.vimeo.com/external/459389137.hd.mp4?s=964e360f6996936b708905b2fcf9bdd66c26de0d&profile_id=170&oauth2_token_id=57447761",

      ];
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
                    child: StoryWidget(data: data),
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
}
