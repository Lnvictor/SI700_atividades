import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trab_01/logic/screen_manager/bottom_nav_bloc.dart';
import 'package:trab_01/logic/screen_manager/bottom_nav_state.dart';

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
    return BlocProvider<BottomNavigationBloc>(
      create: (context) => BottomNavigationBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Demo app"),
        ),
        body: Center(),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(child: Text("Campeonatos")),
              ListTile(
                leading: Icon(Icons.access_alarm_rounded),
                title: Text("Brasileirao"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return BrasileiraoScreen();
                  }));
                },
              ),
              ListTile(
                leading: Icon(Icons.stop_circle_sharp),
                title: Text("Copa do Brasil"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return CopaBrasilScreen();
                  }));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
