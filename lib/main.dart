import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextStyle _style = TextStyle(color: Colors.white);
  TextStyle _styleblack = TextStyle(color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Color(0xFF212121),
          appBar: AppBar(
            backgroundColor: Colors.amberAccent,
            title: Text(
              "App title",
              style: _styleblack,
            ),
            centerTitle: true,
          ),
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "Text 0",
                  style: _style,
                ),
                Text(
                  "Text 1",
                  style: _style,
                )
              ],
            ),
          )),
    );
  }
}
