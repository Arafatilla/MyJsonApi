
import 'dart:convert';

List<Post> postFromJson(String str) => List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  int id;
  String title;

  Post({
    required this.id,
    required this.title,
  });


  // the constructor factory allow us to convert the data from a json format to a dart object
  factory Post.fromJson(Map<String, dynamic> j) => Post(
    id: j["id"],
    title: j["title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
  };
}
