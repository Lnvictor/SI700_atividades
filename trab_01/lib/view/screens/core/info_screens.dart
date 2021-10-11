import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trab_01/logic/screen_manager/fixture_bloc.dart';
import 'package:trab_01/logic/screen_manager/fixture_state.dart';

class FixtureScreen extends StatelessWidget {
  final List<String> entries = <String>[
    '1',
    '2',
    '3',
    "4",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
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
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                      child: Text(
                        "Rodadas",
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(fontSize: 20, color: Colors.blueAccent),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                          child: ListView.separated(
                        padding: const EdgeInsets.all(8),
                        itemCount: entries.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.cyan,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            height: 50,
                            child: ListTile(
                              title: Text('Rodada ${entries[index]}'),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => GameScreen()),
                                );
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
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: Text(
                  "Tabela",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.blueAccent),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Table(
              defaultColumnWidth: FixedColumnWidth(50.0),
              border: TableBorder.all(
                  color: Colors.lightBlue, style: BorderStyle.solid, width: 2),
              children: [
                TableRow(children: [
                  Column(
                      children: [Text('Pos', style: TextStyle(fontSize: 15))]),
                  Column(children: [
                    Text('Clube', style: TextStyle(fontSize: 15))
                  ]),
                  Column(
                      children: [Text('PTS', style: TextStyle(fontSize: 15))]),
                  Column(
                      children: [Text('PJ', style: TextStyle(fontSize: 15))]),
                  Column(children: [Text('V', style: TextStyle(fontSize: 15))]),
                  Column(children: [Text('E', style: TextStyle(fontSize: 15))]),
                  Column(children: [Text('D', style: TextStyle(fontSize: 15))]),
                  Column(
                      children: [Text('GP', style: TextStyle(fontSize: 15))]),
                  Column(
                      children: [Text('GC', style: TextStyle(fontSize: 15))]),
                  Column(
                      children: [Text('SG', style: TextStyle(fontSize: 15))]),
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
                  Column(children: [Text('2')]),
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
                  Column(children: [Text('3')]),
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
                  Column(children: [Text('4')]),
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
                  Column(children: [Text('5')]),
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
                  Column(children: [Text('6')]),
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
                  Column(children: [Text('7')]),
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
                  Column(children: [Text('8')]),
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
                  Column(children: [Text('9')]),
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
                  Column(children: [Text('10')]),
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
    return BlocProvider<FixtureBloc>(
        create: (context) => FixtureBloc(),
        child: BlocBuilder<FixtureBloc, FixtureState>(
          builder: (context, state) {
            if (state is GenericView) {
              return Scaffold(
                body: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                      child: Text(
                        "Partidas",
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(fontSize: 20, color: Colors.blueAccent),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                          child: ListView.separated(
                        padding: const EdgeInsets.all(8),
                        itemCount: entries.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.cyan,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            height: 50,
                            child: ListTile(
                              leading: Text('${entries[index]}'),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => GameScreen()),
                                );
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
            }
            return GameScreen();
          },
        ));
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
    return BlocProvider<FixtureBloc>(
      create: (context) => FixtureBloc(),
      child: Scaffold(
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: Text(
                "Partidas",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.blueAccent),
              ),
            ),
            Expanded(
              child: SizedBox(
                  child: ListView.separated(
                padding: const EdgeInsets.all(8),
                itemCount: entries.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.cyan,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    height: 50,
                    child: ListTile(
                      leading: Text('${entries[index]}'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => GameScreen()),
                        );
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
      ),
    );
  }
}

class GameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Partida"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Sábado, 02/10/2021",
                style: TextStyle(fontSize: 15, color: Colors.blueAccent),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Castelão",
                style: TextStyle(fontSize: 15, color: Colors.blueAccent),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "21:03",
                style: TextStyle(fontSize: 15, color: Colors.blueAccent),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Fortaleza 3 x 0 São Paulo",
                style: TextStyle(fontSize: 30, color: Colors.blueAccent),
              ),
            ],
          ),
        ));
  }
}
