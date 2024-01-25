import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:instagram_stories/commons/app_images.dart';
import 'package:instagram_stories/commons/app_text_styles.dart';
import 'package:instagram_stories/views/home/home_page_vm.dart';
import 'package:instagram_stories/views/stories/story_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomePageVM vm = Get.put<HomePageVM>(HomePageVM());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> listIcon = [
      AppImages.img1,
      AppImages.img2,
      AppImages.img3,
      AppImages.img4,
      AppImages.img5,
    ];

    List<String> listTitles = [
      "Design Tips",
      "Portfolio",
      "Resources",
      "UI Basics",
      "Web Design",
      "Team",
    ];

    List<String> images = [
      "https://images.pexels.com/photos/19869392/pexels-photo-19869392.jpeg",
      "https://images.pexels.com/photos/19867843/pexels-photo-19867843.jpeg",
      "https://images.pexels.com/photos/19855379/pexels-photo-19855379.jpeg",
      "https://images.pexels.com/photos/19869392/pexels-photo-19869392.jpeg",
      "https://images.pexels.com/photos/19867843/pexels-photo-19867843.jpeg",
      "https://images.pexels.com/photos/19855379/pexels-photo-19855379.jpeg",
      "https://images.pexels.com/photos/19869392/pexels-photo-19869392.jpeg",
      "https://images.pexels.com/photos/19867843/pexels-photo-19867843.jpeg",
      "https://images.pexels.com/photos/19855379/pexels-photo-19855379.jpeg",
      "https://images.pexels.com/photos/19869392/pexels-photo-19869392.jpeg",
    ];

    return GetBuilder<HomePageVM>(
      builder: (logic) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: _buildAppBar(),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(const StoryPage());
                              },
                              child: Image.asset(AppImages.imgAvatar),
                            ),
                            Row(
                              children: [
                                buildTextInfoUser(
                                  '2121',
                                  "Publicações",
                                ),
                                const SizedBox(width: 10),
                                buildTextInfoUser(
                                  '421 m',
                                  "Seguidores",
                                ),
                                const SizedBox(width: 10),
                                buildTextInfoUser(
                                  '2121',
                                  "A seguir",
                                ),
                              ],
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Username',
                                style: AppTextStyle.black14Bold,
                              ),
                              Text(
                                'Agência',
                                style: AppTextStyle.grey14,
                              ),
                              Text(
                                'O seu site de sonhos, está no sitio certo. 💻',
                                style: AppTextStyle.black14W,
                              ),
                              Text(
                                'codefive.pt',
                                style: AppTextStyle.black14W,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          width: 100,
                                        ),
                                        Image.asset(AppImages.imgFollow1),
                                        Positioned(
                                          left: 20,
                                          child:
                                              Image.asset(AppImages.imgFollow2),
                                        ),
                                        Positioned(
                                          left: 40,
                                          child:
                                              Image.asset(AppImages.imgFollow3),
                                        )
                                      ],
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Seguido por joaocorreia09, vanda.carvalho e 16 outros amigos',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: AppTextStyle.black14W,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    buildButtonContact(
                                      "Seguir",
                                      AppTextStyle.white14Bold,
                                      "0xFF3597F0",
                                    ),
                                    buildButtonContact(
                                      "Mensagem",
                                      AppTextStyle.black14Bold,
                                      "0xFFEFEFEF",
                                    ),
                                    buildButtonContact(
                                      "Contactar",
                                      AppTextStyle.black14Bold,
                                      "0xFFEFEFEF",
                                    ),
                                    buildFollowButton(),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: List.generate(
                                      listIcon.length,
                                      (index) => buildItemFeature(
                                          listIcon[index], listTitles[index])),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                          color: Color(0xFFEFEFEF)),
                                      child: SvgPicture.asset(
                                          AppImages.icGridImages),
                                    ),
                                    Container(
                                      decoration: const BoxDecoration(
                                          color: Color(0xFFEFEFEF)),
                                      child: SvgPicture.asset(
                                          AppImages.icGridVideo),
                                    ),
                                    Container(
                                      decoration: const BoxDecoration(
                                          color: Color(0xFFEFEFEF)),
                                      child: SvgPicture.asset(
                                          AppImages.icGridProfile),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  gridImages(images),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget gridImages(List<String> images) {
    return GridView.builder(
      physics: const ScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 2,
        crossAxisCount: 3,
        mainAxisSpacing: 2,
        childAspectRatio: 1,
      ),
      itemCount: images.length,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return Image.network(
          images[index],
          fit: BoxFit.cover,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) return child;
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        );
      },
    );
  }

  Widget buildFollowButton() {
    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: const Color(0xFFEFEFEF),
        borderRadius: BorderRadius.circular(10),
      ),
      child: SvgPicture.asset(AppImages.icAddFr),
    );
  }

  Widget buildButtonContact(
      String title, TextStyle style, String colorButton) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 13),
      decoration: BoxDecoration(
        color: const Color(0xFF3597F0),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        title,
        style: AppTextStyle.white14Bold,
      ),
    );
  }

  Widget buildTextInfoUser(String num, String type) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          num,
          style: AppTextStyle.black14W,
        ),
        Text(
          type,
          style: AppTextStyle.black14W,
        ),
      ],
    );
  }

  Widget buildItemFeature(String icon, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          icon,
        ),
        Text(
          title,
          style: AppTextStyle.black12W,
        ),
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      leading: InkWell(
        child: SvgPicture.asset(
          AppImages.icBack,
          fit: BoxFit.scaleDown,
        ),
      ),
      title: RichText(
        text: TextSpan(
          children: [
            TextSpan(text: "Username", style: AppTextStyle.black16Bold),
            const WidgetSpan(
              child: SizedBox(width: 5),
            ),
            WidgetSpan(
              child: SvgPicture.asset(
                AppImages.icArtist,
                fit: BoxFit.scaleDown,
              ),
            ),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              SvgPicture.asset(
                AppImages.icBell,
              ),
              const SizedBox(width: 20),
              SvgPicture.asset(
                AppImages.icMenuTopBlack,
                fit: BoxFit.scaleDown,
              ),
            ],
          ),
        )
      ],
    );
  }
}
