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
    map['id'] = this._id;
    map['title'] = this._title;
    map['author'] = this._author;
    map['content'] = this._content;
    return map;
  }

  Post.map(dynamic obj) {
    this._id = obj['id'];
    this._title = obj['title'];
    this._author = obj['author'];
    this._content = obj['contnet'];
  }
}
