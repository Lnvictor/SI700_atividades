import 'package:trab_01/model/user.dart';

abstract class RegisterEvent {}

class MakeRegister extends RegisterEvent {
  User? user;

  MakeRegister({this.user});
}

class ChangeOnDropDownMenu extends RegisterEvent {}
