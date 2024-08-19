class User {
  final int? userId;
  final String username;
  final String password;

  User({this.userId, required this.username, required this.password});

  Map<String, dynamic> toMap() {
    return {
      'id': userId,
      'username': username,
      'password': password,
    };
  }

  static User fromMap(Map<String, dynamic> map) {
    return User(
      userId: map['id'],
      username: map['username'],
      password: map['password'],
    );
  }
}