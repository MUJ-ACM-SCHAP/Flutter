import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Student {
  Student({this.name, this.regno, this.branch, this.mobileno, this.isEnrolled});

  String name;
  int regno;
  String branch;
  String mobileno;
  bool isEnrolled;

  Student.fromJsonManual(Map<String, dynamic> json) {
    name = json['name'] as String;
    regno = json['regno'] as int;
    branch = json['branch'] as String;
    mobileno = json['mobileno'] as String;
    isEnrolled = json['isEnrolled'] as bool;
  }

  Map<String, dynamic> toJsonManual() => {
        'name': name,
        'regno': regno,
        'branch': branch,
        'mobileno': mobileno,
        'isEnrolled': isEnrolled
      };

  factory Student.fromJson(Map<String, dynamic> json) =>
      _$StudentFromJson(json);

  Map<String, dynamic> toJson() => _$StudentToJson(this);
}

@JsonSerializable()
class Post {
  Post() {
    userId = 0;
    id = 0;
    title = "";
    body = "";
  }
  int userId;
  int id;
  String title;
  String body;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);
}

@JsonSerializable()
class MyJsonObject {
  MyJsonObject({this.id, this.nm, this.hse, this.cty, this.yrs});

  int id;
  String nm;
  String cty;
  String hse;
  String yrs;

  factory MyJsonObject.fromJson(Map<String, dynamic> json) =>
      _$MyJsonObjectFromJson(json);
  Map<String, dynamic> toJson() => _$MyJsonObjectToJson(this);
}
