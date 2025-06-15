// ignore_for_file: public_member_api_docs, sort_constructors_first

enum SkillEnum { beginner, intermediate, advanced }

class SkillModel {
  final int sortOrder;
  final String skill;
  final String skillImage;
  final SkillEnum skillLevel;

  SkillModel(
      {required this.sortOrder,
      required this.skill,
      required this.skillImage,
      required this.skillLevel});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'sortOrder': sortOrder,
      'skill': skill,
      'skillImage': skillImage,
      'skillLevel': skillEnumToIntConverter(skillLevel),
    };
  }

  factory SkillModel.fromJson(Map<String, dynamic> map) {
    return SkillModel(
        sortOrder: map['sortOrder'] as int,
        skill: map['skill'] as String,
        skillImage: map['skillImage'] as String,
        skillLevel: intToSkillEnumConverter(map['skillLevel'] as int));
  }
}

int skillEnumToIntConverter(SkillEnum skillEnum) {
  switch (skillEnum) {
    case SkillEnum.beginner:
      return 0;
    case SkillEnum.intermediate:
      return 1;
    case SkillEnum.advanced:
      return 2;

    default:
      return 0;
  }
}

SkillEnum intToSkillEnumConverter(int skillEnumInInt) {
  switch (skillEnumInInt) {
    case 0:
      return SkillEnum.beginner;
    case 1:
      return SkillEnum.intermediate;
    case 2:
      return SkillEnum.advanced;

    default:
      return SkillEnum.beginner;
  }
}

String skillEnumToTextConverter(SkillEnum skillEnum) {
  switch (skillEnum) {
    case SkillEnum.beginner:
      return "Beginner";
    case SkillEnum.intermediate:
      return "Intermediate";
    case SkillEnum.advanced:
      return "Advanced";

    default:
      return "Beginner";
  }
}
