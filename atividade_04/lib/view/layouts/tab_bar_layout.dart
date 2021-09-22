import 'package:flutter/material.dart';
import 'package:atividade_04/view/screens/first_screen.dart';
import 'package:atividade_04/view/screens/second_screen.dart';
import 'package:atividade_04/view/screens/third_screen.dart';

class MyTabBarLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(143, 0, 255, 1),
            title: Text("Atividade 03"),
            bottom: TabBar(
              tabs: [
                Tab(
                    child: Text(
                      "Victor Akio Uchiyama",
                      textAlign: TextAlign.center,
                    ),
                    icon: Icon(Icons.person)),
                Tab(
                    child: Text(
                      "Victor Pereira",
                      textAlign: TextAlign.center,
                    ),
                    icon: Icon(Icons.person)),
                Tab(
                    child: Text(
                      "Login",
                      textAlign: TextAlign.center,
                    ),
                    icon: Icon(Icons.login)),
              ],
            ),
          ),
          body: TabBarView(children: [
            FirstScreen(),
            //Text("Lewartosky"),
            SecondScreen(),
            ThirdScreen(),
          ])),
    );
  }
}
