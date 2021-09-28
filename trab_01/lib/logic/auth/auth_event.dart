abstract class AuthEvent {}

class LoginUser extends AuthEvent {
  String? username;
  String? password;

  LoginUser({this.username, this.password});
}

class Logout extends AuthEvent {}
