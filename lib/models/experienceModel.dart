// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ExperienceModel {
  final int id;
  final String companyImage;
  final String companyName;
  final String designation;
  final ExperienceYear workingYears;
  final String description;
  final int sortOrder;

  ExperienceModel(
      {required this.id,
      required this.companyImage,
      required this.companyName,
      required this.designation,
      required this.workingYears,
      this.description =
          "Learned so many new skill and teamwork.Good thing is good job to get new creative ideas",
      required this.sortOrder});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "companyImage": companyImage,
      'companyName': companyName,
      'designation': designation,
      'workingYears': workingYears.toMap(),
      'description': description,
      'sortOrder': sortOrder
    };
  }

  factory ExperienceModel.fromMap(Map<String, dynamic> map) {
    return ExperienceModel(
      id: map['id'] as int,
      companyImage: map["companyImage"] as String,
      companyName: map['companyName'] as String,
      designation: map['designation'] as String,
      workingYears:
          ExperienceYear.fromMap(map['workingYears'] as Map<String, dynamic>),
      description: map['description'] as String,
      sortOrder: map['sortOrder'] as int,
    );
  }
}

class ExperienceYear {
  final int joiningDate;
  final int? endingDate;
  final bool isCurrent;

  ExperienceYear(
      {required this.joiningDate, this.endingDate, this.isCurrent = false});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'joiningDate': joiningDate,
      'endingDate': endingDate,
      'isCurrent': isCurrent,
    };
  }

  factory ExperienceYear.fromMap(Map<String, dynamic> map) {
    return ExperienceYear(
      joiningDate: map['joiningDate'] as int,
      endingDate: map['endingDate'] != null ? map['endingDate'] as int : null,
      isCurrent: map['isCurrent'] as bool,
    );
  }
}
