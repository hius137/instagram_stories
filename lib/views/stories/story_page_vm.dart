import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:instagram_stories/models/entities/story_entity.dart';
import 'package:instagram_stories/models/entities/user_entity.dart';
import 'package:instagram_stories/models/response/response.dart';

class StoryPageVM extends GetxController {
  static StoryPageVM get find => Get.find<StoryPageVM>();

  List<User> listUser = [];
  List<Story> listStories = [];
  List<Story> listStoriesById = [];
  List list = [];

  PageController? pageStoryController = PageController();
  PageController? pageStoriesController = PageController();

  int currentIndexStory = 0;
  int currentIndexStories = 0;

  Future<void> getListUser() async {
    final String jsonData =
    await rootBundle.loadString('assets/data/data.json');
    Map<String, dynamic> jsonMap = json.decode(jsonData);
    StoriesResponse storiesResponse = StoriesResponse.fromJson(jsonMap);
    listUser = storiesResponse.user;
  }

  Future<void> readJsonData() async {
    final String jsonData =
        await rootBundle.loadString('assets/data/data.json');
    Map<String, dynamic> jsonMap = json.decode(jsonData);
    StoriesResponse storiesResponse = StoriesResponse.fromJson(jsonMap);
    listStories = storiesResponse.stories;

    for (User user in listUser) {
      int idUser = user.userId;
      List<Story> listStoriesById =
      listStories.where((element) => element.userId == idUser).toList();
      list.add(listStoriesById);
    }

    update();
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
