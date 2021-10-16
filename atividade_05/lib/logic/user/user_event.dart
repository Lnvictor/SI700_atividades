import 'package:trab_01/model/user.dart';

abstract class UserEvent{}

class UpdateUser extends UserEvent {
  int userId = -1;
  User user = User();

  UpdateUser(int userId, User user){
    this.userId = userId;
    this.user = user;
  }
}

class ViewUser extends UserEvent{
  int userId = -1;

  ViewUser(int userId){
    this.userId = userId;
  }
}

class DeleteUser extends UserEvent{
  int userId = -1;

  DeleteUser(int userId){
    this.userId = userId;
  }
}