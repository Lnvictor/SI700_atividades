import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:atividade_04/logic/auth/auth_bloc.dart';
import 'package:atividade_04/logic/auth/auth_event.dart';

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = new GlobalKey();
    String? username;
    String? password;
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Form(
        key: formkey,
        child: Column(
          children: [
            TextFormField(
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
            TextFormField(
              obscureText: true,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      formkey.currentState!.save();
                      BlocProvider.of<AuthBloc>(context)
                          .add(Login(username: username, password: password));
                    }
                  },
                  child: Text("Entrar"),
                ),
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<AuthBloc>(context).add(Logout());
                  },
                  child: Text("Sair"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
