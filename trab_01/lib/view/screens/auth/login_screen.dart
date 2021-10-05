import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trab_01/logic/auth/auth_bloc.dart';
import 'package:trab_01/logic/auth/auth_event.dart';
import 'package:trab_01/logic/auth/auth_state.dart';
import 'package:trab_01/view/screens/auth/register_screen.dart';
import 'package:trab_01/view/screens/core/home.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = new GlobalKey();
    String? username;
    String? password;

    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is Unauthenticated) {
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
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          formkey.currentState!.save();
                          // Lançando evento
                          BlocProvider.of<AuthBloc>(context).add(LoginUser(
                              username: username, password: password));
                        }
                      },
                      child: Text("Submit"),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterScreen()));
                        },
                        child: Text("Registrar"))
                  ],
                )
              ],
            ),
          ),
        );
      } else {
        return HomeScreen();
      }
    });
  }
}
