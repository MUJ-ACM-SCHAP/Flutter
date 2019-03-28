// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Student _$StudentFromJson(Map<String, dynamic> json) {
  return Student(
      name: json['name'] as String,
      regno: json['regno'] as int,
      branch: json['branch'] as String,
      mobileno: json['mobileno'] as String,
      isEnrolled: json['isEnrolled'] as bool);
}

Map<String, dynamic> _$StudentToJson(Student instance) => <String, dynamic>{
      'name': instance.name,
      'regno': instance.regno,
      'branch': instance.branch,
      'mobileno': instance.mobileno,
      'isEnrolled': instance.isEnrolled
    };

Post _$PostFromJson(Map<String, dynamic> json) {
  return Post()
    ..userId = json['userId'] as int
    ..id = json['id'] as int
    ..title = json['title'] as String
    ..body = json['body'] as String;
}

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'body': instance.body
    };

MyJsonObject _$MyJsonObjectFromJson(Map<String, dynamic> json) {
  return MyJsonObject(
      id: json['id'] as int,
      nm: json['nm'] as String,
      hse: json['hse'] as String,
      cty: json['cty'] as String,
      yrs: json['yrs'] as String);
}

Map<String, dynamic> _$MyJsonObjectToJson(MyJsonObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nm': instance.nm,
      'cty': instance.cty,
      'hse': instance.hse,
      'yrs': instance.yrs
    };
