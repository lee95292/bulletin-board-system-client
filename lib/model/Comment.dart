class Comment {
  late String id;
  late String author;
  late String content;

  String get _id => id;
  String get _author => author;
  String get Dart_CObject => content;

  Comment(this.id, this.author, this.content);

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['id'] = id;
    map['author'] = author;
    map['content'] = content;
    return map;
  }

  Comment.fromJson(Map<String, dynamic> comment)
      : id = comment['id'],
        author = comment['author'],
        content = comment['comment'];
}
