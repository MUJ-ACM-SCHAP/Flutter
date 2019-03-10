import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String _text;
  double _opacity = 1, _opacity1 = 1;

  @override
  void initState() {
    super.initState();
    getResponse().then((s) => setState(() => _text = s));
    Future.delayed(Duration(seconds: 2), () => setState(() => _opacity = 0))
        .then((_) {
      Future.delayed(Duration(seconds: 1), () => setState(() => _opacity1 = 0));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: AnimatedOpacity(
                duration: Duration(seconds: 1),
                opacity: _opacity1,
                curve: Curves.decelerate,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: FractionalOffset.topRight,
                          end: FractionalOffset.bottomLeft,
                          colors: [Color(0xFFb92b27), Color(0xFF1565C0)])),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  AnimatedOpacity(
                    duration: Duration(seconds: 1),
                    curve: Curves.easeInBack,
                    opacity: _opacity,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 100,
                      child: Container(
                        height: 100,
                        width: 100,
                        child: FlutterLogo(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: SafeArea(
                child: AnimatedOpacity(
                  duration: Duration(seconds: 1),
                  opacity: 1 - _opacity1,
                  curve: Curves.decelerate,
                  child: AppScreen(text: _text),
                ),
              ),
            ),
          ],
        ));
  }
}

class AppScreen extends StatefulWidget {
  final String text;

  AppScreen({@required this.text});

  @override
  _AppScreenState createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AppBar(title: Text("class2"), centerTitle: true),
        Flexible(
          child: widget.text == null
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(child: Text(widget.text)),
        ),
      ],
    );
  }
}

Future<String> getResponse() async {
  return await http.read(
      "https://raw.githubusercontent.com/AgentFabulous/android_flutter_updater/baked-release/README.md");
}
