class Post {
  late String id;
  late String title;
  late String author;
  late String content;

  String get _id => id;
  String get _title => title;
  String get _author => author;
  String get _content => content;

  // Post.fromJson(Map<String, dynamic> map,
  //     {required this.id,
  //     required this.author,
  //     required this.content,
  //     required this.title});
  Post.fromJson(Map<String, dynamic> map)
      : id = map['id'],
        title = map['title'],
        author = map['author'],
        content = map['contnet'];

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['id'] = _id;
    map['title'] = _title;
    map['author'] = _author;
    map['content'] = _content;
    return map;
  }

  Post.map(dynamic obj) {
    id = obj['id'];
    title = obj['title'];
    author = obj['author'];
    content = obj['contnet'];
  }
}
