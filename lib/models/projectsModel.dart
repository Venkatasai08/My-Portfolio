// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProjectModel {
  final String id;
  final String imageUrl;
  final String title;
  final List<String> technologies;
  final String techStack;
  final String description;
  final bool isApp;
  final String gitUrl;
  final String link;
  final int order;

  ProjectModel({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.technologies,
    required this.techStack,
    required this.description,
    required this.isApp,
    required this.gitUrl,
    required this.link,
    required this.order,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'imageUrl': imageUrl,
      'title': title,
      'technologies': technologies,
      'techStack': techStack,
      'description': description,
      'isApp': isApp,
      'gitUrl': gitUrl,
      'link': link,
      'order': order
    };
  }

  factory ProjectModel.fromMap(Map<String, dynamic> map) {
    return ProjectModel(
      id: map['id'] as String,
      imageUrl: map['imageUrl'] as String,
      title: map['title'] as String,
      technologies: map['technologies'] as List<String>,
      techStack: map['techStack'] as String,
      description: map['description'] as String,
      isApp: map['isApp'] as bool,
      gitUrl: map['gitUrl'] as String,
      link: map['link'] as String,
      order: map['order'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProjectModel.fromJson(String source) =>
      ProjectModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
