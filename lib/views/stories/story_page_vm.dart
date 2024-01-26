import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:instagram_stories/models/stories_model.dart';
import 'package:instagram_stories/models/story_model.dart';

class StoryPageVM extends GetxController{
  static StoryPageVM get find => Get.find<StoryPageVM>();

  List<Story> stories = [];
  List<Story> storiesByIdUser = [];

  PageController? pageController = PageController();
  late AnimationController controller;

  int currentIndex = 0;
  
  Future<void> readJsonData(int idUser) async {
    final String jsonData = await rootBundle.loadString('assets/data/data.json');
    Map<String, dynamic> jsonMap = json.decode(jsonData);
    StoriesResponse storiesResponse = StoriesResponse.fromJson(jsonMap);
    stories = storiesResponse.stories;
    storiesByIdUser = stories.where((element) => element.userId == idUser).toList();
    update();
  }
  void getStoryByUserId(int idUser){
    storiesByIdUser = stories.where((element) => element.userId == idUser).toList();

  }

  void showProgress(TickerProvider tickerProvider){
    controller = AnimationController(
      vsync: tickerProvider,
      duration: const Duration(seconds: 5),
    )..addListener(() {
      update();
    });
    controller.repeat(reverse: true);
  }

  void onChangePage(value){
    currentIndex = value;
    update();
  }
}