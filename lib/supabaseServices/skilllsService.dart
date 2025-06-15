import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/models/experienceModel.dart';
import 'package:portfolio/models/skillsModel.dart';
import 'package:portfolio/supabaseServices/dashboardService.dart';

import '../models/headerModel.dart';

class SkillsService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final Constants consts = Constants();
  List<SkillModel> mySkills = [
    SkillModel(
        sortOrder: 1,
        skill: "Flutter",
        skillImage:
            "https://cdn.iconscout.com/icon/free/png-512/free-flutter-3628777-3030139.png?f=webp&w=256",
        skillLevel: SkillEnum.advanced),
    SkillModel(
        sortOrder: 2,
        skill: "Firebase",
        skillImage:
            "https://cdn.iconscout.com/icon/free/png-512/free-firebase-1-282796.png?f=webp&w=256",
        skillLevel: SkillEnum.advanced),
    SkillModel(
        sortOrder: 3,
        skill: "Supabase",
        skillImage:
            "https://supabase.com/_next/image?url=%2Fimages%2Fcompany%2Fcommunity%2Fsupabase.png&w=3840&q=75",
        skillLevel: SkillEnum.intermediate),
    SkillModel(
        sortOrder: 4,
        skill: "GetX",
        skillImage:
            "https://res.cloudinary.com/strapi/image/upload/v1621261454/logo_vgoldp.png",
        skillLevel: SkillEnum.advanced),
    SkillModel(
        sortOrder: 5,
        skill: "Riverpod",
        skillImage:
            "https://res.cloudinary.com/dytmxozk2/image/upload/v1749731684/riverpod_kylzsl.png",
        skillLevel: SkillEnum.advanced),
    SkillModel(
        sortOrder: 6,
        skill: "Bloc",
        skillImage:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_TCfKFiabkrZ2OeCDmLZwoAlOzduZbpNitu-a4hzynA&s",
        skillLevel: SkillEnum.beginner),
    SkillModel(
        sortOrder: 7,
        skill: "Api",
        skillImage:
            "https://cdn.iconscout.com/icon/premium/png-512-thumb/api-1675146-1421517.png?f=webp&w=256",
        skillLevel: SkillEnum.advanced),
    SkillModel(
        sortOrder: 8,
        skill: "HTML",
        skillImage:
            "https://cdn.iconscout.com/icon/premium/png-512-thumb/html-2752158-2284975.png?f=webp&w=256",
        skillLevel: SkillEnum.advanced),
    SkillModel(
        sortOrder: 9,
        skill: "CSS",
        skillImage:
            "https://cdn.iconscout.com/icon/free/png-512/free-css-131-722685.png?f=webp&w=256",
        skillLevel: SkillEnum.intermediate),
    SkillModel(
        sortOrder: 10,
        skill: "Tailwind css",
        skillImage:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d5/Tailwind_CSS_Logo.svg/2560px-Tailwind_CSS_Logo.svg.png",
        skillLevel: SkillEnum.intermediate),
    SkillModel(
        sortOrder: 11,
        skill: "Javascript",
        skillImage:
            "https://cdn.iconscout.com/icon/premium/png-512-thumb/javascript-2752148-2284965.png?f=webp&w=256",
        skillLevel: SkillEnum.intermediate),
    SkillModel(
        sortOrder: 12,
        skill: "React",
        skillImage:
            "https://cdn.iconscout.com/icon/free/png-512/free-react-3-1175109.png?f=webp&w=256",
        skillLevel: SkillEnum.intermediate),
    SkillModel(
        sortOrder: 13,
        skill: "Node Js",
        skillImage:
            "https://cdn.iconscout.com/icon/free/png-512/free-node-js-1-1174935.png?f=webp&w=256",
        skillLevel: SkillEnum.intermediate),
    SkillModel(
        sortOrder: 14,
        skill: "Mongo DB",
        skillImage:
            "https://cdn.iconscout.com/icon/free/png-512/free-mongodb-4-1175139.png?f=webp&w=256",
        skillLevel: SkillEnum.intermediate),
    SkillModel(
        sortOrder: 15,
        skill: "Python",
        skillImage:
            "https://cdn.iconscout.com/icon/free/png-512/free-python-2038870-1720083.png?f=webp&w=256",
        skillLevel: SkillEnum.intermediate),
    SkillModel(
        sortOrder: 16,
        skill: "Git",
        skillImage:
            "https://cdn.iconscout.com/icon/free/png-512/free-git-18-1175219.png?f=webp&w=256",
        skillLevel: SkillEnum.intermediate),
  ];
  List<ExperienceModel> experienceList = [
    ExperienceModel(
        id: 1,
        companyImage:
            "https://res.cloudinary.com/dytmxozk2/image/upload/v1749729783/cogent_adhjtq.png",
        description:
            "In this company I have worked on 2 projects, like 'FaviChat' a social media applicatiion where you can earn money, 'Radiosurabhi' a radio application for telugu listeners from U.S.",
        companyName: "Cogent Integrated Business Solutions",
        designation: "Flutter Developer",
        workingYears: ExperienceYear(
          isCurrent: true,
          joiningDate: DateTime(2022, 4, 1).millisecondsSinceEpoch,
        ),
        sortOrder: 1),
    ExperienceModel(
        id: 2,
        companyImage:
            "https://res.cloudinary.com/dytmxozk2/image/upload/v1749729783/mikhvision_logo_qpywvw.jpg",
        description:
            "This is product base company where i have developed chat application alone and i have developed html and css screen for requirement.",
        companyName: "Mikhvishion Pvt.Ltd",
        designation: "Flutter Developer",
        workingYears: ExperienceYear(
            joiningDate: DateTime(2021, 11, 15).millisecondsSinceEpoch,
            endingDate: DateTime(2022, 3, 30).millisecondsSinceEpoch),
        sortOrder: 2),
    ExperienceModel(
        id: 2,
        companyImage:
            "https://res.cloudinary.com/dytmxozk2/image/upload/v1749729782/swecha_tsktdl.jpg",
        companyName: "Swecha",
        designation: "Full Stack Developer",
        workingYears: ExperienceYear(
          joiningDate: DateTime(2021, 6, 3).millisecondsSinceEpoch,
          endingDate: DateTime(2021, 10, 15).millisecondsSinceEpoch,
        ),
        sortOrder: 3),
  ];
  Future<ResponseModel> storeSkills() async {
    // List<Map<String, dynamic>> data =
    //     mySkills.map((e) => e.toMap()).toList();
    // await supabase.from(sbconsts.experience).insert(data);

    try {
      for (var element in mySkills) {
        debugPrint(element.skill);
        await docRef
            .collection(consts.skills)
            .doc(element.skill)
            .set(element.toJson());
      }
      return ResponseModel(isSuccess: true, message: "Success");
    } catch (e) {
      return ResponseModel(isSuccess: false, message: e.toString());
    }
  }

  Future<ResponseModel> storeExperience() async {
    // List<Map<String, dynamic>> data =
    //     experienceList.map((e) => e.toMap()).toList();
    //     await supabase.from(sbconsts.experience).insert(data);
    try {
      for (var element in experienceList) {
        await docRef
            .collection(consts.experience)
            .doc(element.companyName)
            .set(element.toMap());
      }
      return ResponseModel(isSuccess: true, message: "Success");
    } catch (e) {
      return ResponseModel(isSuccess: false, message: e.toString());
    }
  }

  Future<List<SkillModel>> getSkills() async {
    try {
      QuerySnapshot data =
          await docRef.collection(consts.skills).orderBy("sortOrder").get();
      return data.docs
          .map((e) => SkillModel.fromJson(e.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      return mySkills;
    }
  }

  Future<List<ExperienceModel>> getExperience() async {
    try {
      QuerySnapshot data =
          await docRef.collection(consts.experience).orderBy("sortOrder").get();
      List<ExperienceModel> sample = data.docs
          .map((e) => ExperienceModel.fromMap(e.data() as Map<String, dynamic>))
          .toList();
      sample.sort(
        (a, b) => a.sortOrder.compareTo(b.sortOrder),
      );
      return sample;
    } catch (e) {
      return experienceList;
    }
  }
}
