import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trab_01/logic/auth/register_bloc.dart';
import 'package:trab_01/logic/auth/register_event.dart';
import 'package:trab_01/logic/auth/register_state.dart';
import 'package:trab_01/view/screens/auth/login_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = new GlobalKey();
    String? name;
    String? lastName;
    String? email;
    String? team;
    String? birthday;
    String? city;
    String? rgState;

    return BlocProvider<RegisterBloc>(
        create: (context) => RegisterBloc(),
        child:
            BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
          if (!(state is Valid)) {
            var screen = Scaffold(
              appBar: AppBar(title: Text("Registrar")),
              body: Form(
                key: formkey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(hintText: "Nome"),
                      validator: (String? inValue) {
                        if (inValue!.length == 0) {
                          return "Insira algo como nome";
                        }
                        return null;
                      },
                      onSaved: (String? inValue) {
                        name = inValue!;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: "Sobrenome"),
                      validator: (String? inValue) {
                        if (inValue!.length == 0) {
                          return "Insira algo como sobrenome";
                        }
                        return null;
                      },
                      onSaved: (String? inValue) {
                        lastName = inValue;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: "Email"),
                      validator: (String? inValue) {
                        if (inValue!.length < 4) {
                          return "Digite algo como email";
                        }
                        return null;
                      },
                      onSaved: (String? inValue) {
                        email = inValue!;
                      },
                    ),
                    DropdownButton<String>(
                      value: team,
                      items: <String>['Sao Paulo', 'Curintia']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (dynamic value) {
                        team = value;
                        BlocProvider.of<RegisterBloc>(context)
                            .add(ChangeOnDropDownMenu());
                      },
                    ),
                    TextFormField(
                      decoration:
                          InputDecoration(hintText: "Data de nascimento"),
                      onSaved: (String? inValue) {
                        birthday = inValue;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: "Cidade"),
                      onSaved: (String? inValue) {
                        city = inValue;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: "Estado"),
                      onSaved: (String? inValue) {
                        rgState = inValue;
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          formkey.currentState!.save();
                          // Lançando evento
                          BlocProvider.of<RegisterBloc>(context).add(
                              MakeRegister(
                                  name: name,
                                  lastName: lastName,
                                  email: email,
                                  team: team,
                                  birthday: birthday,
                                  city: city,
                                  state: rgState));
                        }
                      },
                      child: Text("Submit"),
                    ),
                  ],
                ),
              ),
            );

            if (state is Invalid) {
              Fluttertoast.showToast(
                msg: "Email Duplicado",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
              );
            }

            return screen;
          } else {
            return LoginScreen();
          }
        }));
  }
}
