import 'package:flutter/material.dart';
import 'package:atividade_03/view/layouts/tab_bar_layout.dart';

void main() {
  runApp(MyFirstApp());
}

class MyFirstApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Atividade 03",
      home: MyTabBarLayout(),
    );
  }
}
