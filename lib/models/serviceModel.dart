// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ServiceModel {
  final String image;
  final String text;
  final String title;
  final int sortOrder;

  ServiceModel({
    required this.image,
    required this.text,
    required this.title,
    required this.sortOrder,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sortOrder': sortOrder,
      'image': image,
      'text': text,
      'title': title,
    };
  }

  factory ServiceModel.fromMap(Map<String, dynamic> map) {
    return ServiceModel(
      sortOrder: map["sortOrder"] as int,
      image: map['image'] as String,
      text: map['text'] as String,
      title: map['title'] as String,
    );
  }
}

class WorkedLogosModel {
  final int id;
  final String name;
  final String logo;
  final int sortOrder;

  WorkedLogosModel(
      {required this.id,
      required this.name,
      required this.logo,
      required this.sortOrder});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'logo': logo,
      'sortOrder': sortOrder,
    };
  }

  factory WorkedLogosModel.fromMap(Map<String, dynamic> map) {
    return WorkedLogosModel(
      id: map['id'] as int,
      name: map['name'] as String,
      logo: map['logo'] as String,
      sortOrder: map['sortOrder'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory WorkedLogosModel.fromJson(String source) =>
      WorkedLogosModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
