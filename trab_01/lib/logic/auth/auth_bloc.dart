import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trab_01/logic/auth/auth_event.dart';

import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(Unauthenticated());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is LoginUser) {
      if (event.password == "asdf") {
        yield Authenticated(username: event.username);
      }
    } else {
      yield Unauthenticated();
    }
  }
}
