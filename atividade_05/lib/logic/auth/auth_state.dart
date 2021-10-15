abstract class AuthState {}

class Authenticated extends AuthState {
  String? username;

  Authenticated({this.username});
}

class Unauthenticated extends AuthState {}
