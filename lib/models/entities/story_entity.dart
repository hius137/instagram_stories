import 'package:instagram_stories/models/enum/story_type.dart';

class Story {
  Story({
    required this.storyType,
    required this.duration,
    required this.userId,
    required this.url,
  });

  StoryType storyType;
  int duration;
  int userId;
  String url;

  factory Story.fromJson(Map<dynamic, dynamic> json) => Story(
    storyType: storyTypeValues.map[json["story_type"]]!,
    duration: json["duration"],
    userId: json["user_id"],
    url: json["url"],
  );

  Map<dynamic, dynamic> toJson() => {
    "story_type": storyTypeValues.reverse[storyType],
    "duration": duration,
    "user_id": userId,
    "url": url,
  };
}


final storyTypeValues = EnumValues({
  "image": StoryType.image,
  "video": StoryType.video
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}