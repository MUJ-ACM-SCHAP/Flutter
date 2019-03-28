import 'package:class3/data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'class3',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'class3'),
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
  Student s = Student.fromJson({
    "name": "Ronny Singh",
    "mobileno": "100",
    "regno": 1,
    "branch": "Mechanical"
  });

  Post p = Post();

  List<MyJsonObject> objs = List();

  @override
  void initState() {
    /*http
        .get("https://jsonplaceholder.typicode.com/posts/10")
        .then((r) => setState(() => p = Post.fromJson(json.decode(r.body))));*/
    http
        .get("http://mysafeinfo.com/api/data?list=englishmonarchs&format=json")
        .then((r) => setState(() {
              objs = (json.decode(r.body) as List)
                  .map((e) => MyJsonObject.fromJson(e))
                  .toList();
            }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      //body: StudentCard(s),
      //body: PostCard(p),
      body: ListView.builder(
          itemCount: objs.length,
          itemBuilder: (context, i) => MyJsonCard(objs[i])),
    );
  }
}

class PostCard extends StatelessWidget {
  final Post post;

  PostCard(this.post);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(post.id.toString()),
            Text(post.userId.toString()),
            Text(post.title),
            Text(post.body),
          ]),
    ));
  }
}

class MyJsonCard extends StatelessWidget {
  final MyJsonObject obj;

  MyJsonCard(this.obj);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(obj.id.toString()),
            Text(obj.nm),
            Text(obj.hse),
            Text(obj.yrs),
            Text(obj.cty),
          ],
        ),
      ),
    );
  }
}

class StudentCard extends StatelessWidget {
  final Student student;

  StudentCard(this.student);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(student.name),
            Text(student.regno.toString()),
            Text(student.branch),
            Text(student.mobileno),
          ],
        ),
      ),
    );
  }
}
