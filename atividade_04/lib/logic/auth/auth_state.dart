abstract class AuthState {}

class Unauthenticated extends AuthState {}

class Authenticated extends AuthState {
  String? username;

  Authenticated({this.username});
}
