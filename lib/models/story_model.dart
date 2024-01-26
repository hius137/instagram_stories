
enum StoryType {
  image,
  video,
}

class Story {
  String? url;
  StoryType? storyType;
  Duration? duration;
  int? userId;

  Story({
    this.url,
    this.storyType,
    this.duration,
    this.userId,
  });

  Story.fromJson(dynamic json) {
    url = json['url'];
    storyType = json['story_type'];
    duration = json['duration'];
    userId = json['user_id'];

  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = url;
    map['story_type'] = storyType;
    map['story_type'] = storyType;
    map['user_id'] = userId;
    return map;
  }
}
