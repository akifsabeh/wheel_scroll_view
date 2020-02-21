import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryTextTheme: TextTheme(title: TextStyle(color: Colors.white))),
      home: MyHomePage(title: 'Wheel Scroll'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _listItems = List<Widget>.generate(10, (i) => _listItem(i));
  double _offAxisFraction = 0.0;
  double _diameterRatio = 2;

  void _select(String choice) {
    setState(() {
      switch (choice) {
        case "Normal":
          _offAxisFraction = 0.0;
          _diameterRatio = 2;
          break;
        case "Style 1":
          _offAxisFraction = 0.0;
          _diameterRatio = 1;
          break;
        case "Style 2":
          _offAxisFraction = -0.5;
          _diameterRatio = 2;
          break;
        case "Style 3":
          _offAxisFraction = 0.5;
          _diameterRatio = 2;
          break;
        case "Style 4":
          _offAxisFraction = -0.5;
          _diameterRatio = 1;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: _select,
            itemBuilder: (BuildContext context) {
              return choices.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Center(
          child: ListWheelScrollView(
        children: _listItems,
        itemExtent: 200.0,
        offAxisFraction: _offAxisFraction,
        diameterRatio: _diameterRatio,
        perspective: 0.001,
      )),
    );
  }
}

Widget _listItem(int i) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.blueAccent,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Center(
        child: Text(
      "Position $i",
      style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.0),
    )),
  );
}

const List<String> choices = <String>[
  'Normal',
  'Style 1',
  'Style 2',
  'Style 3',
  'Style 4',
];
