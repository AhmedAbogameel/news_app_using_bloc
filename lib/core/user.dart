class User {
  String _name;

  String get name => _name;

  String setName(String name)=> _name = name;

  User.init();
  static User _user = User.init();

  factory User(){
    return _user;
  }

}