import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:instagram_stories/models/stories_model.dart';
import 'package:instagram_stories/models/story_model.dart';

class StoryPageVM extends GetxController {
  static StoryPageVM get find => Get.find<StoryPageVM>();

  List<Story> listStories = [];
  List<Story> listStoriesById = [];
  List list = [];

  PageController? pageStoryController = PageController();
  PageController? pageStoriesController = PageController();

  int currentIndexStory = 0;
  int currentIndexStories = 0;


  Future<void> readJsonData() async {
    final String jsonData =
        await rootBundle.loadString('assets/data/data.json');
    Map<String, dynamic> jsonMap = json.decode(jsonData);
    StoriesResponse storiesResponse = StoriesResponse.fromJson(jsonMap);
    listStories = storiesResponse.stories;
    int i;
    for (i = 1; i <= 5; i++) {
      listStoriesById =
          listStories.where((element) => element.userId == i).toList();
      list.add(listStoriesById);
    }
    update();
  }

  void getStoryByUserId(int idUser) {
    listStoriesById =
        listStories.where((element) => element.userId == idUser).toList();
  }


  void onChangePageStory(value) {
    currentIndexStory = value;
    update();
  }

  void onChangePageStories(value) {
    currentIndexStory = 0;
    currentIndexStories = value;
    update();
  }
}
