class Post {
  final int id;
  final int userId;
  final String title;
  final String body;

  const Post({required this.id, required this.title, required this.body, required this.userId});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  @override
  String toString() {
    return "id = $id, title = $title, body = $body";
  }
}
