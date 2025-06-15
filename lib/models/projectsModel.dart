// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProjectModel {
  final int id;
  final String companyName;
  final String imageUrl;
  final String title;
  final List<String> technologies;
  final String techStack;
  final String description;
  final bool isApp;
  final String gitUrl;
  final String link;
  final int order;

  ProjectModel(
      {required this.id,
      required this.imageUrl,
      required this.title,
      required this.technologies,
      required this.techStack,
      required this.description,
      required this.isApp,
      required this.gitUrl,
      required this.link,
      required this.order,
      this.companyName = "Personal"});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      'imageUrl': imageUrl,
      'title': title,
      'technologies': technologies,
      'techStack': techStack,
      'description': description,
      'isApp': isApp,
      'gitUrl': gitUrl,
      'link': link,
      'order': order,
      "companyName": companyName
    };
  }

  factory ProjectModel.fromMap(Map<String, dynamic> map) {
    return ProjectModel(
        id: map['id'] as int,
        imageUrl: map['imageUrl'] as String,
        title: map['title'] as String,
        technologies: (map['technologies'] as List<dynamic>)
            .map((e) => e.toString())
            .toList(),
        techStack: map['techStack'] as String,
        description: map['description'] as String,
        isApp: map['isApp'] as bool,
        gitUrl: map['gitUrl'] as String,
        link: map['link'] as String,
        order: map['order'] as int,
        companyName: map["companyName"] as String);
  }

  String toJson() => json.encode(toMap());

  factory ProjectModel.fromJson(String source) =>
      ProjectModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
