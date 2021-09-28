abstract class RegisterEvent {}

class MakeRegister extends RegisterEvent {
  String? name;
  String? lastName;
  String? username;
  String? email;
  String? team;
  String? birthday;
  String? city;
  String? state;

  MakeRegister(
      {this.name,
      this.lastName,
      this.username,
      this.email,
      this.team,
      this.birthday,
      this.city,
      this.state});
}

class ChangeOnDropDownMenu extends RegisterEvent {}
