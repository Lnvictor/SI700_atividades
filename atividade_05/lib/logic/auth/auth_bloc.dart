import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trab_01/data/local/local_database.dart';
import 'package:trab_01/logic/auth/auth_event.dart';
import 'package:trab_01/model/user.dart';

import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(Unauthenticated());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    print("askdjasldjaslkdaslkjdaslkdj");
    if (event is LoginUser) {
      List<User?> list = await DatabaseLocalServer.helper.getNoteList();
      for (int i = 0; i < list.length; i++) {
        User? user = list[i];
        if (user != null) {
          if (user.name == event.username && user.password == event.password) {
            yield Authenticated(username: event.username);
          }
        }
      }
    } else {
      yield Unauthenticated();
    }
  }
}
