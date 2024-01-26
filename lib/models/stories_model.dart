import 'dart:convert';

import 'package:instagram_stories/models/story_model.dart';

StoriesResponse storiesModalFromJson(String str) => StoriesResponse.fromJson(json.decode(str));

String storiesModalToJson(StoriesResponse data) => json.encode(data.toJson());

class StoriesResponse {
    StoriesResponse({
        required this.stories,
    });

    List<Story> stories;

    factory StoriesResponse.fromJson(Map<dynamic, dynamic> json) => StoriesResponse(
        stories: List<Story>.from(json["stories"].map((x) => Story.fromJson(x))),
    );

    Map<dynamic, dynamic> toJson() => {
        "stories": List<dynamic>.from(stories.map((x) => x.toJson()).toList()),
    };
}


