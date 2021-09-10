import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

List<List<int>> insertionSort(List<int> list) {
  var i, current, j;
  List<List<int>> output = [];

  for (i = 1; i < list.length; i++) {
    current = list[i];
    j = i - 1;

    while (j >= 0 && list[j] > current) {
      list[j + 1] = list[j];
      j = j - 1;
    }
    list[j + 1] = current;

    output.add(List.from(list));
  }

  return output;
}

Widget getOrdenationSteps(List<int> list) {
  List<List<int>> sortedList = insertionSort(list);

  var column = Column(mainAxisSize: MainAxisSize.min, children: [
    Row(children: [
      Text("Dupla: "),
    ]),
    Row(
      children: [
        Text(
          "Victor Akio Uchiyama   RA: 244974",
        ),
      ],
    ),
    Row(children: [
      Text("Victor Pereira        RA: 245055"),
    ])
  ]);

  for (var i = 0; i < sortedList.length; i++) {
    var row = Row(children: []);
    for (var j = 0; j < sortedList[i].length; j++) {
      var tmp = j == sortedList[i].length - 1
          ? sortedList[i][j].toString()
          : sortedList[i][j].toString() + ", ";

      row.children.add(Text(tmp));
    }
    column.children.add(row);
  }

  return column;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<int> p = [3, 1, 2, 9, 15, 1, 3];

    return MaterialApp(
      title: "SI700",
      home: Scaffold(
          appBar: AppBar(
            title: Text("SI700 - Atividade 02"),
            backgroundColor: Color.fromRGBO(0, 0, 255, 1),
          ),
          body: Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.all(15),
              color: Color.fromRGBO(238, 130, 238, 1),
              child: getOrdenationSteps(p))),
    );
  }
}
