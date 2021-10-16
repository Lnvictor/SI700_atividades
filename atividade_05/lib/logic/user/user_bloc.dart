import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trab_01/data/local/local_database.dart';
import 'package:trab_01/logic/user/user_event.dart';
import 'package:trab_01/logic/user/user_state.dart';
import 'package:trab_01/model/user.dart';
import 'package:trab_01/view/screens/auth/login_screen.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(View(user));

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is UpdateUser){
      await DatabaseLocalServer.helper.updateUser(event.userId, event.user);
      yield View(user);
    } else if (event is ViewUser){
        List<User> list = await DatabaseLocalServer.helper.getUserList();
        var user;

        for (int i = 0; i < list.length; i++){
          if (list[i].id == event.userId){
            user = list[i];
            break;
          }
        }

        yield View(user);
      }

      else if(event is DeleteUser){
        await DatabaseLocalServer.helper.deleteUser(event.userId);
        yield View(user);
      }

      yield View(user);
  }
}


