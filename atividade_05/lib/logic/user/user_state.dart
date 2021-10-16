import 'package:trab_01/model/user.dart';

abstract class UserState{}

class View extends UserState{
  User user = User();

  View(User user){
    this.user = user;
  }
}