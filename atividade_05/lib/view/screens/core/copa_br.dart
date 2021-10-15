import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trab_01/logic/screen_manager/bottom_nav_bloc.dart';
import 'package:trab_01/logic/screen_manager/bottom_nav_event.dart';
import 'package:trab_01/logic/screen_manager/bottom_nav_state.dart';

import 'info_screens.dart';

class CopaBrasilScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BottomNavigationBloc>(
      create: (context) => BottomNavigationBloc(),
      child: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
          builder: (context, state) {
        int index = state is Fixture ? 0 : 1;
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Copa do Brasil",
              textAlign: TextAlign.center,
            ),
          ),
          body: () {
            if (state is Fixture) {
              return InitialFases();
            }
            return FinalFases();
          }(),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.table_chart), label: "Fases Iniciais"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.table_chart), label: "Fase Final")
            ],
            currentIndex: index,
            onTap: (value) {
              index = value;
              BlocProvider.of<BottomNavigationBloc>(context)
                  .add(ClickOnItem(index: index));
            },
          ),
        );
      }),
    );
  }
}
