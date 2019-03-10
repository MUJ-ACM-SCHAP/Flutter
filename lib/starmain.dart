import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyScaffold(),
    );
  }
}

class MyScaffold extends StatefulWidget {
  @override
  _MyScaffoldState createState() => _MyScaffoldState();
}

class _MyScaffoldState extends State<MyScaffold> {
  double _value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("class2")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              onChanged: (String s) => setState(() => _value = double.parse(s)),
            ),
            StarBoi(value: _value),
          ],
        ),
      ),
    );
  }
}

class StarBoi extends StatefulWidget {
  final double value;
  StarBoi({@required this.value});

  @override
  _StarBoiState createState() => _StarBoiState();
}

class _StarBoiState extends State<StarBoi> {
  int _value;

  @override
  Widget build(BuildContext context) {
    _value = widget.value.round();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _value >= 1
            ? Icon(Icons.star, color: Colors.amber)
            : Icon(Icons.star_border),
        _value >= 2
            ? Icon(Icons.star, color: Colors.amber)
            : Icon(Icons.star_border),
        _value >= 3
            ? Icon(Icons.star, color: Colors.amber)
            : Icon(Icons.star_border),
        _value >= 4
            ? Icon(Icons.star, color: Colors.amber)
            : Icon(Icons.star_border),
        _value >= 5
            ? Icon(Icons.star, color: Colors.amber)
            : Icon(Icons.star_border),
      ],
    );
  }
}
