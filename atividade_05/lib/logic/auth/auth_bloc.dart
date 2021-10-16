import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trab_01/data/local/local_database.dart';
import 'package:trab_01/logic/auth/auth_event.dart';
import 'package:trab_01/model/user.dart';
import 'package:trab_01/view/screens/auth/login_screen.dart';

import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(Unauthenticated());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is LoginUser) {
      List<User> list = await DatabaseLocalServer.helper.getUserList();
      for (int i = 0; i < list.length; i++) {
          User user2 = list[i];
          user = user2;
          if (user2.name == event.username && user2.password == event.password) {
            yield Authenticated(userId: user2.id, username: event.username);
        }
      }
    } else {
      yield Unauthenticated();
    }
  }
}
