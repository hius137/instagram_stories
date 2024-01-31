import 'package:instagram_stories/models/entities/story_entity.dart';
import 'package:instagram_stories/models/entities/user_entity.dart';


class StoriesResponse {
    StoriesResponse({
        required this.stories,
        required this.user,
    });

    List<Story> stories;
    List<User> user;

    factory StoriesResponse.fromJson(Map<dynamic, dynamic> json) => StoriesResponse(
        stories: List<Story>.from(json["stories"].map((x) => Story.fromJson(x))),
        user: List<User>.from(json["user"].map((x) => User.fromJson(x))),
    );

    Map<dynamic, dynamic> toJson() => {
        "stories": List<dynamic>.from(stories.map((x) => x.toJson()).toList()),
        "user": List<dynamic>.from(user.map((x) => x.toJson()).toList()),
    };
}


