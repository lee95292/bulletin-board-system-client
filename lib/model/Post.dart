class Post {
  late String id;
  late String title;
  late String author;
  late String content;

  Post.fromJson(Map<String, dynamic> map)
      : id = map['id'],
        title = map['title'],
        author = map['author'],
        content = map['contnet'];

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['id'] = id;
    map['title'] = title;
    map['author'] = author;
    map['content'] = content;
    return map;
  }

  Post.map(dynamic obj) {
    id = obj['id'];
    title = obj['title'];
    author = obj['author'];
    content = obj['contnet'];
  }
}
