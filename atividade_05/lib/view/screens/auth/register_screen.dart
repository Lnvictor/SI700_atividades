import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trab_01/logic/auth/register_bloc.dart';
import 'package:trab_01/logic/auth/register_event.dart';
import 'package:trab_01/logic/auth/register_state.dart';
import 'package:trab_01/model/user.dart';
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
    String? password;

    return BlocProvider<RegisterBloc>(
        create: (context) => RegisterBloc(),
        child:
            BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
          if (!(state is Valid)) {
            User? user;
            var screen = Scaffold(
              appBar: AppBar(title: Text("Registrar")),
              body: Form(
                key: formkey,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: "Nome", border: OutlineInputBorder()),
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
                        SizedBox(height: 5),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: "Sobrenome",
                              border: OutlineInputBorder()),
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
                        SizedBox(height: 5),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: "Email", border: OutlineInputBorder()),
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
                        SizedBox(height: 5),
                        DropdownButton<String>(
                          hint: Text("Selecione o Seu time"),
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
                        SizedBox(height: 5),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: "Data de nascimento",
                              border: OutlineInputBorder()),
                          onSaved: (String? inValue) {
                            birthday = inValue;
                          },
                        ),
                        SizedBox(height: 5),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: "Cidade",
                              border: OutlineInputBorder()),
                          onSaved: (String? inValue) {
                            city = inValue;
                          },
                        ),
                        SizedBox(height: 5),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: "Estado",
                              border: OutlineInputBorder()),
                          onSaved: (String? inValue) {
                            rgState = inValue;
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: "Senha", border: OutlineInputBorder()),
                          onSaved: (String? inValue) {
                            rgState = inValue;
                          },
                        ),
                        SizedBox(height: 5),
                        ElevatedButton(
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              formkey.currentState!.save();
                              if (user != null) {
                                user.name = name!;
                                user.lastName = lastName!;
                                user.email = email!;
                                user.birthday = birthday!;
                                user.rgState = rgState!;
                                user.team = team!;
                                user.city = city!;
                                user.password = password!;
                              }

                              // Lançando evento
                              BlocProvider.of<RegisterBloc>(context)
                                  .add(MakeRegister(user: user));
                            }
                          },
                          child: Text("Registrar"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );

            if (state is Invalid) {
              Fluttertoast.showToast(
                  msg: "Email Duplicado",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  webBgColor: "#eb3434");
            }

            return screen;
          } else {
            return LoginScreen();
          }
        }));
  }
}
