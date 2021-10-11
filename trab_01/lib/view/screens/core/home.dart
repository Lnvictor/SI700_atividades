import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:trab_01/logic/auth/auth_bloc.dart';
import 'package:trab_01/logic/auth/auth_event.dart';
import 'package:trab_01/logic/auth/register_bloc.dart';
import 'package:trab_01/logic/auth/register_event.dart';
import 'package:trab_01/logic/auth/register_state.dart';
import 'package:trab_01/logic/screen_manager/bottom_nav_bloc.dart';
import 'package:trab_01/view/screens/auth/login_screen.dart';

import 'brasileirao_screen.dart';
import 'copa_br.dart';

// class _HomeScreenState extends State<HomeScreen> {
//   int _selectedIndex = 0;
//   List<Widget> _screens = [BrasileiraoScreen(), CopaBrasilScreen()];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
// }

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = new GlobalKey();
    String? team;

    return BlocProvider<BottomNavigationBloc>(
      create: (context) => BottomNavigationBloc(),
      child: BlocProvider<RegisterBloc>(
        create: (context) => RegisterBloc(),
        child: BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Home"),
              ),
              body: Container(
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  width: 3690,
                  child: Column(
                    children: [
                      Text(
                        "Seja Bem-Vindo ${username2}",
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(fontSize: 20, color: Colors.blueAccent),
                      ),
                      Text(
                        "Selecione o time que você quer visualizar",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15),
                      ),
                      Form(
                        key: formkey,
                        child: Column(children: [
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
                          ElevatedButton(
                            onPressed: () {
                              if (formkey.currentState!.validate()) {
                                Fluttertoast.showToast(
                                  msg: "Você selecionou o ${team}",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                );
                                formkey.currentState!.save();
                              }
                            },
                            child: Text("Salvar"),
                          ),
                        ]),
                      ),
                    ],
                  )),
              drawer: Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    DrawerHeader(
                      child: Text("Campeonatos"),
                      margin: EdgeInsets.zero,
                    ),
                    ListTile(
                      leading: Icon(Icons.sports_soccer_sharp),
                      title: Text("Brasileirao"),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return BrasileiraoScreen();
                        }));
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.sports_soccer_rounded),
                      title: Text("Copa do Brasil"),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return CopaBrasilScreen();
                        }));
                      },
                    ),
                    ListTile(
                      title: Text("Sair"),
                      onTap: () {
                        BlocProvider.of<AuthBloc>(context).add(Logout());
                      },
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
