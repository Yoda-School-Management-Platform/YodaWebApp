class User {
  String _username;
  String _authToken;
  String _email;
  String _school;
  List<dynamic> _roles;
  User(this._username, this._email, this._school, this._roles, this._authToken);

  User.map(dynamic obj) {
    this._username = obj["username"];
    this._email = obj["email"];
    this._school = obj["schoolName"];
    this._authToken = obj["accessToken"];   //TODO : CHANGE AUTH TOKEN TO ACCESS TOKEN
    this._roles = obj["roles"];
  }

  String get username => _username;
  String get authToken => _authToken;
  String get email => _email;
  String get school => _school;
  List<dynamic> get roles => _roles;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["username"] = _username;
    map["accessToken"] = _authToken;
    map["school"] = _school;
    map["email"] = _email;
    map["roles"] = roles;

    return map;
  }
}