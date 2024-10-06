class User {
  String id;
  String name;

  User.fromJson(Map<String, dynamic> user)
      : id = user['id'],
        name = user['name'];
}
