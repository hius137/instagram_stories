import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:instagram_stories/models/entities/story_entity.dart';
import 'package:instagram_stories/models/response/response.dart';

class HomePageVM extends GetxController{
  static HomePageVM get find => Get.find<HomePageVM>();
  List<Story> listStories = [];

  Future<void> readJsonData() async {
    final String jsonData =
    await rootBundle.loadString('assets/data/data.json');
    Map<String, dynamic> jsonMap = json.decode(jsonData);
    StoriesResponse storiesResponse = StoriesResponse.fromJson(jsonMap);
    listStories = storiesResponse.stories;
    update();
  }
}