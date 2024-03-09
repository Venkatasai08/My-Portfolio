import 'package:flutter/material.dart';
import 'package:portfolio/models/experienceModel.dart';
import 'package:portfolio/models/skillsModel.dart';

class SkillProvider extends ChangeNotifier {
  int? hoverIndex;
  List<SkillModel> mySkills = [
    SkillModel(
        id: 1,
        skill: "Flutter",
        skillImage:
            "https://cdn.iconscout.com/icon/free/png-512/free-flutter-3628777-3030139.png?f=webp&w=256",
        skillLevel: SkillEnum.advanced),
    SkillModel(
        id: 2,
        skill: "Firebase",
        skillImage:
            "https://cdn.iconscout.com/icon/free/png-512/free-firebase-1-282796.png?f=webp&w=256",
        skillLevel: SkillEnum.advanced),
    SkillModel(
        id: 3,
        skill: "Supabase",
        skillImage:
            "https://supabase.com/_next/image?url=%2Fimages%2Fcompany%2Fcommunity%2Fsupabase.png&w=3840&q=75",
        skillLevel: SkillEnum.intermediate),
    SkillModel(
        id: 4,
        skill: "GetX",
        skillImage:
            "https://res.cloudinary.com/strapi/image/upload/v1621261454/logo_vgoldp.png",
        skillLevel: SkillEnum.advanced),
    SkillModel(
        id: 5,
        skill: "Riverpod",
        skillImage: "https://riverpod.dev/img/logo.png",
        skillLevel: SkillEnum.advanced),
    SkillModel(
        id: 6,
        skill: "Bloc",
        skillImage:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_TCfKFiabkrZ2OeCDmLZwoAlOzduZbpNitu-a4hzynA&s",
        skillLevel: SkillEnum.beginner),
    SkillModel(
        id: 7,
        skill: "Api",
        skillImage:
            "https://cdn.iconscout.com/icon/premium/png-512-thumb/api-1675146-1421517.png?f=webp&w=256",
        skillLevel: SkillEnum.advanced),
    SkillModel(
        id: 14,
        skill: "HTML",
        skillImage:
            "https://cdn.iconscout.com/icon/premium/png-512-thumb/html-2752158-2284975.png?f=webp&w=256",
        skillLevel: SkillEnum.advanced),
    SkillModel(
        id: 9,
        skill: "CSS",
        skillImage:
            "https://cdn.iconscout.com/icon/free/png-512/free-css-131-722685.png?f=webp&w=256",
        skillLevel: SkillEnum.intermediate),
    SkillModel(
        id: 10,
        skill: "Tailwind css",
        skillImage:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d5/Tailwind_CSS_Logo.svg/2560px-Tailwind_CSS_Logo.svg.png",
        skillLevel: SkillEnum.intermediate),
    SkillModel(
        id: 15,
        skill: "Javascript",
        skillImage:
            "https://cdn.iconscout.com/icon/premium/png-512-thumb/javascript-2752148-2284965.png?f=webp&w=256",
        skillLevel: SkillEnum.intermediate),
    SkillModel(
        id: 8,
        skill: "React",
        skillImage:
            "https://cdn.iconscout.com/icon/free/png-512/free-react-3-1175109.png?f=webp&w=256",
        skillLevel: SkillEnum.intermediate),
    SkillModel(
        id: 11,
        skill: "Node Js",
        skillImage:
            "https://cdn.iconscout.com/icon/free/png-512/free-node-js-1-1174935.png?f=webp&w=256",
        skillLevel: SkillEnum.intermediate),
    SkillModel(
        id: 12,
        skill: "Mongo DB",
        skillImage:
            "https://cdn.iconscout.com/icon/free/png-512/free-mongodb-4-1175139.png?f=webp&w=256",
        skillLevel: SkillEnum.intermediate),
    SkillModel(
        id: 13,
        skill: "Python",
        skillImage:
            "https://cdn.iconscout.com/icon/free/png-512/free-python-2038870-1720083.png?f=webp&w=256",
        skillLevel: SkillEnum.intermediate),
    SkillModel(
        id: 16,
        skill: "Git",
        skillImage:
            "https://cdn.iconscout.com/icon/free/png-512/free-git-18-1175219.png?f=webp&w=256",
        skillLevel: SkillEnum.intermediate),
  ];
  changeHoverINdex(int? index) {
    hoverIndex = index;
    notifyListeners();
  }

  List<ExperienceModel> experienceList = [
    ExperienceModel(
      id: 1,
      companyName: "Cogent Integrated Business Solutions",
      dessignation: "Flutter Developer",
      workingYears: [
        DateTime(2022, 4, 1).millisecondsSinceEpoch,
        DateTime.now().millisecondsSinceEpoch,
      ],
    ),
    ExperienceModel(
        id: 2,
        companyName: "Mikhvishion Pvt.Ltd",
        dessignation: "Flutter Developer",
        workingYears: [
          DateTime(2021, 11, 15).millisecondsSinceEpoch,
          DateTime(2022, 3, 30).millisecondsSinceEpoch,
        ]),
    ExperienceModel(
        id: 2,
        companyName: "Swecha",
        dessignation: "Full Stack Developer",
        workingYears: [
          DateTime(2021, 6, 15).millisecondsSinceEpoch,
          DateTime(2021, 9, 15).millisecondsSinceEpoch,
        ]),
  ];
  int? selectedExperience;
  changeSelectedExperience(int? index) {
    selectedExperience = index;
    notifyListeners();
  }
}
