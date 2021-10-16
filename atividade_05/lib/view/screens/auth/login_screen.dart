import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trab_01/logic/auth/auth_bloc.dart';
import 'package:trab_01/logic/auth/auth_event.dart';
import 'package:trab_01/logic/auth/auth_state.dart';
import 'package:trab_01/view/screens/auth/register_screen.dart';
import 'package:trab_01/view/screens/core/home.dart';

var username2;
var userId;
var user;

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = new GlobalKey();
    String? username;
    String? password;

    return BlocProvider(
        create: (context) => AuthBloc(),
        child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
          if (state is Unauthenticated) {
            return Scaffold(
              appBar: AppBar(title: Text("Login")),
              body: Form(
                key: formkey,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Usuário"),
                          validator: (String? inValue) {
                            if (inValue!.length == 0) {
                              return "Insira algo como username";
                            }
                            return null;
                          },
                          onSaved: (String? inValue) {
                            username = inValue!;
                          },
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(), labelText: "Senha"),
                          validator: (String? inValue) {
                            if (inValue!.length < 4) {
                              return "Tem que ter ao menos 4 caracters";
                            }
                            return null;
                          },
                          onSaved: (String? inValue) {
                            password = inValue!;
                          },
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                if (formkey.currentState!.validate()) {
                                  formkey.currentState!.save();
                                  // Lançando evento
                                  username2 = username;
                                  BlocProvider.of<AuthBloc>(context).add(
                                      LoginUser(
                                          username: username,
                                          password: password));
                                }
                              },
                              child: Text("Entrar"),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RegisterScreen()));
                                },
                                child: Text("Registrar"))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else if (state is Authenticated) {
            userId = state.userId;
          }
          return HomeScreen();
        }));
  }
}
