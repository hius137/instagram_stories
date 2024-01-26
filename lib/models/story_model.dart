
enum StoryType {
  image,
  video,
}

class Story {
  final String url;
  final StoryType storyType;
  final Duration duration;
  final int userId;

  const Story({
    required this.url,
    required this.storyType,
    required this.duration,
    required this.userId,
  });
}
