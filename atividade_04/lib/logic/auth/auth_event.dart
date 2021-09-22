abstract class AuthEvent {}

class Login extends AuthEvent {
  String? username;
  String? password;

  Login({this.username, this.password});
}

class Logout extends AuthEvent {}
