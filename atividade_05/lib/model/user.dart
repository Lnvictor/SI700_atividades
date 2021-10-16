class User {
  int _id = -1;
  String _name = "";
  String _lastName = "";
  String _email = "";
  String _team = "";
  String _birthday = "";
  String _city = "";
  String _rgState = "";
  String _password = "";

  User() {
    _id = -1;
    _name = "";
    _lastName = "";
    _email = "";
    _team = "";
    _birthday = "";
    _city = "";
    _rgState = "";
    _password = "";
  }

  User.fromMap(map) {
    this._id = map["id"];
    this._name = map["name"];
    this._lastName = map["last_name"];
    this._email = map["email"];
    this._team = map["team"];
    this._birthday = map["birthday"];
    this._city = map["city"];
    this._rgState = map["state"];
    this._password = map["password"];
  }

  int get id => _id;
  String get name => _name;
  String get lastName => _lastName;
  String get email => _email;
  String get team => _team;
  String get birthday => _birthday;
  String get city => _city;
  String get rgState => _rgState;
  String get password => _password;

  set id(int id){
    this._id = id;
  }

  set name(String name) {
    this._name = name;
  }

  set lastName(String lastName) {
    this._lastName = lastName;
  }

  set email(String email) {
    this._email = email;
  }

  set team(String team) {
    this._team = team;
  }

  set birthday(String birthday) {
    this._birthday = birthday;
  }

  set city(String city) {
    this._city = city;
  }

  set rgState(String rgState) {
    this._rgState = rgState;
  }

  set password(String password) {
    this._password = password;
  }

  toMap() {
    var map = Map<String, dynamic>();
    map["name"] = _name;
    map["last_name"] = _lastName;
    map["email"] = _email;
    map["team"] = _team;
    map["birthday"] = _birthday;
    map["city"] = _city;
    map["state"] = _rgState;
    map["password"] = _password;
    return map;
  }
}
