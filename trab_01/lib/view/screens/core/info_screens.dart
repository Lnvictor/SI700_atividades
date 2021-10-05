import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trab_01/logic/screen_manager/fixture_bloc.dart';
import 'package:trab_01/logic/screen_manager/fixture_event.dart';
import 'package:trab_01/logic/screen_manager/fixture_state.dart';

class FixtureScreen extends StatelessWidget {
  final List<String> entries = <String>[
    '1',
    '2',
    '3',
    "4",
    "5",
    "5",
    "5",
    "5",
    "5",
    "5",
    "5",
    "5",
    "5",
    "5",
    "5",
    "5",
    "5",
    "5",
    "5",
    "5",
    "5",
    "5",
    "5",
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FixtureBloc>(
        create: (context) => FixtureBloc(),
        child: BlocBuilder<FixtureBloc, FixtureState>(
          builder: (context, state) {
            if (state is GenericView) {
              return Scaffold(
                body: Column(
                  children: [
                    Text("Rodadas"),
                    Expanded(
                      child: SizedBox(
                          child: ListView.separated(
                        padding: const EdgeInsets.all(8),
                        itemCount: entries.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: 50,
                            color: Colors.cyan,
                            child: ListTile(
                              title: Text('Rodada ${entries[index]}'),
                              onTap: () {
                                BlocProvider.of<FixtureBloc>(context)
                                    .add(ClickOnFixture());
                              },
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(),
                      )),
                    ),
                  ],
                ),
              );
            } else
              return GameScreen();
          },
        ));
  }
}

class TableScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [Text("Tabela")],
          ),
          Table(
            defaultColumnWidth: FixedColumnWidth(50.0),
            border: TableBorder.all(
                color: Colors.black, style: BorderStyle.solid, width: 2),
            children: [
              TableRow(children: [
                Column(children: [Text('Pos', style: TextStyle(fontSize: 15))]),
                Column(
                    children: [Text('Clube', style: TextStyle(fontSize: 15))]),
                Column(children: [Text('PTS', style: TextStyle(fontSize: 15))]),
                Column(children: [Text('PJ', style: TextStyle(fontSize: 15))]),
                Column(children: [Text('V', style: TextStyle(fontSize: 15))]),
                Column(children: [Text('E', style: TextStyle(fontSize: 15))]),
                Column(children: [Text('D', style: TextStyle(fontSize: 15))]),
                Column(children: [Text('GP', style: TextStyle(fontSize: 15))]),
                Column(children: [Text('GC', style: TextStyle(fontSize: 15))]),
                Column(children: [Text('SG', style: TextStyle(fontSize: 15))]),
              ]),
              TableRow(children: [
                Column(children: [Text('1')]),
                Column(children: [Text('São Paulo')]),
                Column(children: [Text('65')]),
                Column(children: [Text('22')]),
                Column(children: [Text('17')]),
                Column(children: [Text('3')]),
                Column(children: [Text('2')]),
                Column(children: [Text('35')]),
                Column(children: [Text('10')]),
                Column(children: [Text('25')]),
              ]),
              TableRow(children: [
                Column(children: [Text('1')]),
                Column(children: [Text('São Paulo')]),
                Column(children: [Text('65')]),
                Column(children: [Text('22')]),
                Column(children: [Text('17')]),
                Column(children: [Text('3')]),
                Column(children: [Text('2')]),
                Column(children: [Text('35')]),
                Column(children: [Text('10')]),
                Column(children: [Text('25')]),
              ]),
              TableRow(children: [
                Column(children: [Text('1')]),
                Column(children: [Text('São Paulo')]),
                Column(children: [Text('65')]),
                Column(children: [Text('22')]),
                Column(children: [Text('17')]),
                Column(children: [Text('3')]),
                Column(children: [Text('2')]),
                Column(children: [Text('35')]),
                Column(children: [Text('10')]),
                Column(children: [Text('25')]),
              ]),
              TableRow(children: [
                Column(children: [Text('1')]),
                Column(children: [Text('São Paulo')]),
                Column(children: [Text('65')]),
                Column(children: [Text('22')]),
                Column(children: [Text('17')]),
                Column(children: [Text('3')]),
                Column(children: [Text('2')]),
                Column(children: [Text('35')]),
                Column(children: [Text('10')]),
                Column(children: [Text('25')]),
              ]),
              TableRow(children: [
                Column(children: [Text('1')]),
                Column(children: [Text('São Paulo')]),
                Column(children: [Text('65')]),
                Column(children: [Text('22')]),
                Column(children: [Text('17')]),
                Column(children: [Text('3')]),
                Column(children: [Text('2')]),
                Column(children: [Text('35')]),
                Column(children: [Text('10')]),
                Column(children: [Text('25')]),
              ]),
              TableRow(children: [
                Column(children: [Text('1')]),
                Column(children: [Text('São Paulo')]),
                Column(children: [Text('65')]),
                Column(children: [Text('22')]),
                Column(children: [Text('17')]),
                Column(children: [Text('3')]),
                Column(children: [Text('2')]),
                Column(children: [Text('35')]),
                Column(children: [Text('10')]),
                Column(children: [Text('25')]),
              ]),
              TableRow(children: [
                Column(children: [Text('1')]),
                Column(children: [Text('São Paulo')]),
                Column(children: [Text('65')]),
                Column(children: [Text('22')]),
                Column(children: [Text('17')]),
                Column(children: [Text('3')]),
                Column(children: [Text('2')]),
                Column(children: [Text('35')]),
                Column(children: [Text('10')]),
                Column(children: [Text('25')]),
              ]),
              TableRow(children: [
                Column(children: [Text('1')]),
                Column(children: [Text('São Paulo')]),
                Column(children: [Text('65')]),
                Column(children: [Text('22')]),
                Column(children: [Text('17')]),
                Column(children: [Text('3')]),
                Column(children: [Text('2')]),
                Column(children: [Text('35')]),
                Column(children: [Text('10')]),
                Column(children: [Text('25')]),
              ]),
              TableRow(children: [
                Column(children: [Text('1')]),
                Column(children: [Text('São Paulo')]),
                Column(children: [Text('65')]),
                Column(children: [Text('22')]),
                Column(children: [Text('17')]),
                Column(children: [Text('3')]),
                Column(children: [Text('2')]),
                Column(children: [Text('35')]),
                Column(children: [Text('10')]),
                Column(children: [Text('25')]),
              ]),
              TableRow(children: [
                Column(children: [Text('1')]),
                Column(children: [Text('São Paulo')]),
                Column(children: [Text('65')]),
                Column(children: [Text('22')]),
                Column(children: [Text('17')]),
                Column(children: [Text('3')]),
                Column(children: [Text('2')]),
                Column(children: [Text('35')]),
                Column(children: [Text('10')]),
                Column(children: [Text('25')]),
              ]),
            ],
          ),
        ],
      ),
    );
  }
}

class InitialFases extends StatelessWidget {
  final List<String> entries = [
    "1ª Fase",
    "2ª Fase",
    "3ª Fase",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Partidas"),
          Expanded(
            child: SizedBox(
                child: ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: entries.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 50,
                  color: Colors.cyan,
                  child: Center(child: Text('${entries[index]}')),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            )),
          ),
        ],
      ),
    );
  }
}

class FinalFases extends StatelessWidget {
  final List<String> entries = [
    "Oitavas de final",
    "Quartas de final",
    "Semi-final",
    "Final"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Partidas"),
          Expanded(
            child: SizedBox(
                child: ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: entries.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 50,
                  color: Colors.cyan,
                  child: Center(child: Text('${entries[index]}')),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            )),
          ),
        ],
      ),
    );
  }
}

class GameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Center(
          child: Text("Sábado, 02/10/2021"),
        ),
        Center(
          child: Text("Castelão"),
        ),
        Center(child: Text("21:03")),
        Center(
          child: Text(
            "Fortaleza 3 x 0 São Paulo",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    ));
  }
}
