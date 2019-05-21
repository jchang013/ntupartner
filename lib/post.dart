
class Post {
  final String username;

  Post({this.username});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      username: json['username']
    );
  }
}