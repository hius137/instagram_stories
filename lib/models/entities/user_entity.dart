class User {
  User({
    required this.userId,
    required this.userName,
    required this.avtUrl,
  });

  int userId;
  String userName;
  String avtUrl;

  factory User.fromJson(Map<dynamic, dynamic> json) => User(
    userId: json["user_id"],
    userName: json["user_name"],
    avtUrl: json["avt_url"],
  );

  Map<dynamic, dynamic> toJson() => {
    "user_id": userId,
    "user_name": userName,
    "avt_url": avtUrl,
  };
}