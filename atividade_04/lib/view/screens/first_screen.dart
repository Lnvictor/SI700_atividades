import 'package:atividade_04/logic/auth/auth_bloc.dart';
import 'package:atividade_04/logic/auth/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget getPersonScrollView(String name, String bio, String filename) {
  return SingleChildScrollView(
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.all(40),
          child: ClipOval(
            child: Image.asset("assets/images/" + filename.trim(),
                height: 250, width: 250, fit: BoxFit.cover),
          ),
        ),
        Text(
          name,
          style: TextStyle(fontSize: 20),
        ),
        Center(
          child: Container(
            padding: EdgeInsets.all(30),
            child: Text(
              bio,
              style: TextStyle(
                fontSize: 15,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        )
      ],
    ),
  );
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bio = "Olá, meu nome é Victor Akio Uchiyama, tenho 20 anos, sou natural de "
            "São Carlos - SP e sou estudante de TADS-019 na FT da Unicamp. Atualmente, " +
        "estou estagiando na Ekinops, uma empresa de telecomunicações de Campinas, " +
        "na parte de automatização de testes. Tenho vários hobbies, entre eles " +
        "jogar bola, sinuca, jogar no computador, tocar guitarra e pescar.";

    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is Authenticated) {
        return getPersonScrollView("Victor Akio Uchiyama", bio, "akio.jpeg");
      } else {
        return Container(
          color: Colors.black,
        );
      }
    });
  }
}
