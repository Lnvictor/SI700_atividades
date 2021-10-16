abstract class AuthState {}

class Authenticated extends AuthState {
  String? username;
  int? userId;

  Authenticated({this.userId, this.username});
}

class Unauthenticated extends AuthState {}
