import 'package:atividade_04/logic/auth/auth_bloc.dart';
import 'package:atividade_04/logic/auth/auth_event.dart';
import 'package:atividade_04/logic/auth/auth_state.dart';
import 'package:atividade_04/view/screens/first_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bio = "Meu nome é Victor Pereira, tenho 21 anos e sou natural de Campinas. " +
        "Curso o 6° semestre de TADS na Unicamp e também faço estágio na área de " +
        "desenvolvimento web Backend\n\n" +
        "Os meus hobbies são assistir qualquer tipo de esporte, jogar videogame e " +
        "ouvir música.";

    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is Authenticated) {
        return getPersonScrollView("Victor Pereira", bio, "pereira.jpeg");
      } else {
        return Container(
          color: Colors.black,
        );
      }
    });
  }
}
