import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trab_01/data/local/local_database.dart';

import 'package:trab_01/logic/auth/register_event.dart';
import 'package:trab_01/logic/auth/register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(Neutral());

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is MakeRegister) {
      DatabaseLocalServer.helper.insertUser(event.user);
      yield Valid();
    }
    else {
      yield Neutral();
    }
  }
}
