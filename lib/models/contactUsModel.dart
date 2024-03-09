// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ContactUsModel {
  final int? id;
  final String fullName;
  final String email;
  final String mobileNumber;
  final String subject;
  final String description;

  ContactUsModel(
      {this.id,
      required this.fullName,
      required this.email,
      required this.mobileNumber,
      required this.subject,
      required this.description});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      // 'id': id,
      'fullName': fullName,
      'email': email,
      'mobileNumber': mobileNumber,
      'subject': subject,
      'description': description,
    };
  }

  factory ContactUsModel.fromMap(Map<String, dynamic> map) {
    return ContactUsModel(
      id: map['id'] as int,
      fullName: map['fullName'] as String,
      email: map['email'] as String,
      mobileNumber: map['mobileNumber'] as String,
      subject: map['subject'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ContactUsModel.fromJson(String source) =>
      ContactUsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
