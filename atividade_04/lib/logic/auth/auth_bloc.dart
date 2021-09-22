import 'package:atividade_04/logic/auth/auth_event.dart';
import 'package:atividade_04/logic/auth/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(Unauthenticated());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is Login) {
      if (event.password == "1234") {
        yield Authenticated(username: event.username);
      }
    } else {
      yield Unauthenticated();
    }
  }
}
