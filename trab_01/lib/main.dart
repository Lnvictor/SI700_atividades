import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trab_01/logic/auth/auth_bloc.dart';
import 'package:trab_01/logic/auth/register_bloc.dart';
import 'package:trab_01/view/screens/auth/login_screen.dart';
// import 'package:trab_01/view/wrapper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        /*home: BlocProvider<CounterBloc>(
          create: (context) => CounterBloc(), child: LoginScreen()),*/
        home: BlocProvider(
            create: (context) => AuthBloc(), child: LoginScreen()));
  }
}
