import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:instagram_stories/models/story_model.dart';

class StoryPageVM extends GetxController{
  static StoryPageVM get find => Get.find<StoryPageVM>();
  List<Story> stories = [];

  
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/data/data.json');
    final data = await json.decode(response);
    stories = data["stories"];
    update();
  }
}