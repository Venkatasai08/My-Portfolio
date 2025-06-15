import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/models/headerModel.dart';
import 'package:portfolio/models/projectsModel.dart';
import 'package:portfolio/models/serviceModel.dart';
import 'package:portfolio/supabaseServices/dashboardService.dart';

class ProjectsService {
  final Constants consts = Constants();

  List<ProjectModel> projects = [
    ProjectModel(
        id: 1,
        imageUrl:
            "https://res.cloudinary.com/dytmxozk2/image/upload/v1749727710/snakeGame_r02z2k.jpg",
        title: "Snake game",
        technologies: ["Flutter", 'Firebase', "Riverpod"],
        techStack: "Web Development",
        description: "This is snake game ",
        isApp: false,
        gitUrl: "https://github.com/Venkatasai08/flutterGames/tree/env_dev",
        link: "https://games-ad414.web.app/",
        order: 2),
    ProjectModel(
        id: 2,
        imageUrl:
            "https://res.cloudinary.com/dytmxozk2/image/upload/v1749727712/chatapp_bl7kst.jpg",
        title: "Chat app",
        technologies: ["Flutter", 'Firebase', "Getx", "Notifications"],
        techStack: "App Development",
        description: "This is a Chat app ",
        isApp: true,
        gitUrl: "https://github.com/Venkatasai08/myChat",
        link: "",
        order: 2),
    ProjectModel(
        id: 3,
        imageUrl:
            "https://res.cloudinary.com/dytmxozk2/image/upload/v1749727713/clockApp_kwlxqc.jpg",
        title: "Clock app",
        technologies: ["Flutter", "Provider, SQflite"],
        techStack: "App Development",
        description: "This is a clock app ",
        isApp: true,
        gitUrl: "https://github.com/Venkatasai08/ClockApp",
        link: "",
        order: 2),
    ProjectModel(
        id: 4,
        imageUrl:
            "https://res.cloudinary.com/dytmxozk2/image/upload/v1749727717/canvas_qs5und.jpg",
        title: "Canvas with link converter",
        technologies: ["Flutter", "GetX", "HiveDB"],
        techStack: "App Development",
        description: "We can draw on this canvas ",
        isApp: true,
        gitUrl: "https://github.com/Venkatasai08/myChat",
        link: "https://games-ad414.web.app/",
        order: 2),
    ProjectModel(
        id: 5,
        imageUrl:
            "https://res.cloudinary.com/dytmxozk2/image/upload/v1749727711/musicPlayer_xagxmw.jpg",
        title: "Music Player",
        technologies: ["Flutter", "GetX", "HiveDB"],
        techStack: "App Development",
        description: "This is awesome music player ",
        isApp: true,
        gitUrl: "https://github.com/Venkatasai08/myChat",
        link: "",
        order: 2),
    ProjectModel(
        id: 6,
        imageUrl:
            "https://res.cloudinary.com/dytmxozk2/image/upload/v1749727711/portfolio_heemmb.jpg",
        title: "Portfolio website",
        technologies: ["Flutter", 'Firebase', "Provider"],
        techStack: "Flutter Web Development",
        description: "This is my portfolio ",
        isApp: false,
        gitUrl: "https://github.com/Venkatasai08/My-Portfolio",
        link: "https://venkatasai-portfolio.netlify.app/",
        order: 2),
  ];
  Future<ResponseModel> storeProjects() async {
    // List<Map<String, dynamic>> data = projects.map((e) => e.toMap()).toList();
    try {
      // await supabase.from(sbconsts.projects).insert(data);
      for (var element in projects) {
        await docRef
            .collection(consts.projects)
            .doc(element.title)
            .set(element.toMap());
      }
      return ResponseModel(isSuccess: true, message: "Success");
    } catch (e) {
      return ResponseModel(isSuccess: false, message: e.toString());
    }
  }

  Future<List<ProjectModel>> getProjects() async {
    try {
      QuerySnapshot data = await docRef.collection(consts.projects).get();
      List<ProjectModel> sample = data.docs
          .map((e) => ProjectModel.fromMap(e.data() as Map<String, dynamic>))
          .toList();
      // sample.sort(
      //   (a, b) => a.sortOrder.compareTo(b.sortOrder),
      // );
      debugPrint("${sample.length} of projects");
      return sample;
    } catch (e) {
      debugPrint("$e in prjexts");
      return projects;
    }
  }
}
