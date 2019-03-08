import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: AppContents(),
    );
  }
}

class AppContents extends StatefulWidget {
  @override
  _AppContentsState createState() => _AppContentsState();
}

class _AppContentsState extends State<AppContents> {
  bool toggle = true;
  double _opacity = 0.0;
  double heightFactor, widthFactor;
  int ctr = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (heightFactor == null)
      heightFactor = MediaQuery.of(context).size.height / 888;
    if (widthFactor == null)
      widthFactor = MediaQuery.of(context).size.width / 450;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            toggle = !toggle;
            _opacity = toggle ? 0.0 : 1.0;
            ctr++;
          });
        },
        child: Icon(Icons.update),
      ),
      appBar: AppBar(title: Text("class1"), centerTitle: true),
      body: Container(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0 * heightFactor),
              child: Text("Counter: $ctr"),
            ),
            AnimatedOpacity(
              opacity: _opacity,
              curve: Curves.easeIn,
              duration: Duration(seconds: 2),
              child: FloatingActionButton.extended(
                  onPressed: () => setState(() => ctr--),
                  icon: Icon(Icons.info),
                  label: Text("Extended fab")),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0 * heightFactor),
              child: AnimatedContainer(
                height: (toggle ? 100.0 : 10.0) * heightFactor,
                width: (toggle ? 100.0 : 10.0) * widthFactor,
                color: toggle ? Colors.pink : Colors.blue,
                duration: Duration(seconds: 3),
                curve: Curves.bounceOut,
              ),
            ),
          ],
        )),
      ),
    );
  }
}
