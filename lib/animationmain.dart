import 'package:flutter/material.dart';

void main() => runApp(LogoApp());

class LogoApp extends StatefulWidget {
  _LogoAppState createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  Animation<double> curvyAnimation;
  AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    //animation = Tween<double>(begin: 1, end: 100).animate(controller);
    animation = CurvedAnimation(parent: controller, curve: Curves.elasticOut);
    animation.addListener(() {
      setState(() {});
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: animation.value * 100,
        width: animation.value * 100,
        child: FlutterLogo(),
      ),
    );
  }
}
