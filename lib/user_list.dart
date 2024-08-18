class UserList {
  final int id;
  final String username;
  final String password;

  UserList(this.id, this.username, this.password);
}

class DatabaseManagment {
  List<UserList> _users = [];

  void addUser(String username, String password) {
    final id = _users.length + 1;
    _users.add(UserList(id, username, password));
  }

  UserList? userAuth(String username, String password) {
    return _users.firstWhere(
      (user) => user.username == username && user.password == password,

    );
  }
}
