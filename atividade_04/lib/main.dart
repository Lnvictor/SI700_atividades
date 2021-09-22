import 'package:atividade_04/logic/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:atividade_04/view/layouts/tab_bar_layout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyFirstApp());
}

class MyFirstApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Atividade 04",
      home: BlocProvider(
          create: (context) => AuthBloc(), child: MyTabBarLayout()),
    );
  }
}
