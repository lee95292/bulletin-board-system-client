class Post {
  late String _id;
  late String _title;
  late String _author;
  late String _content;

  String get id => _id;
  String get title => _title;
  String get author => _author;
  String get content => _content;

  Post(this._id, this._author, this._content, this._title);

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['id'] = _id;
    map['title'] = _title;
    map['author'] = _author;
    map['content'] = _content;
    return map;
  }

  Post.map(dynamic obj) {
    _id = obj['id'];
    _title = obj['title'];
    _author = obj['author'];
    _content = obj['contnet'];
  }
}
