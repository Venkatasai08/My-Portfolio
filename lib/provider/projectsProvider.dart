import 'package:flutter/material.dart';
import 'package:portfolio/models/projectsModel.dart';

class ProjectsProvider extends ChangeNotifier {
  List<ProjectModel> projects = [
    ProjectModel(
        id: "1",
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/mychat-bc5a1.appspot.com/o/mediaUploads%2F1709731652272%23Picsart_24-03-06_18-57-13-672.jpg?alt=media&token=a1e9682a-ef66-41d5-9c05-3357d5627b5f',
        title: "Snake game",
        technologies: ["Flutter", 'Firebase', "Riverpod"],
        techStack: "Web Development",
        description: "This is snake game ",
        isApp: false,
        gitUrl: "https://github.com/Venkatasai08/flutterGames/tree/env_dev",
        link: "https://games-ad414.web.app/",
        order: 2),
    ProjectModel(
        id: "2",
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/mychat-bc5a1.appspot.com/o/mediaUploads%2F1709730887722%23Picsart_24-03-06_18-44-00-906.jpg?alt=media&token=f1d3513a-eeac-487c-87fc-1ad8b3cd4aa6',
        title: "Chat app",
        technologies: ["Flutter", 'Firebase', "Getx", "Notifications"],
        techStack: "App Development",
        description: "This is a Chat app ",
        isApp: true,
        gitUrl: "https://github.com/Venkatasai08/myChat",
        link: "",
        order: 2),
    ProjectModel(
        id: "3",
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/mychat-bc5a1.appspot.com/o/mediaUploads%2F1709637723031%23Picsart_24-03-05_16-51-23-668.jpg?alt=media&token=5fe50fe3-8140-4da0-b5ad-be8188e4abca',
        title: "Clock app",
        technologies: ["Flutter", "Provider, SQflite"],
        techStack: "App Development",
        description: "This is a clock app ",
        isApp: true,
        gitUrl: "https://github.com/Venkatasai08/ClockApp",
        link: "",
        order: 2),
    ProjectModel(
        id: "4",
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/mychat-bc5a1.appspot.com/o/mediaUploads%2F1709731095012%23Picsart_24-03-06_18-48-01-443.jpg?alt=media&token=d6001974-6af7-46d4-8eb4-4699c857f5d8',
        title: "Canvas with link converter",
        technologies: ["Flutter", "GetX", "HiveDB"],
        techStack: "App Development",
        description: "We can draw on this canvas ",
        isApp: true,
        gitUrl: "https://github.com/Venkatasai08/myChat",
        link: "https://games-ad414.web.app/",
        order: 2),
    ProjectModel(
        id: "5",
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/mychat-bc5a1.appspot.com/o/mediaUploads%2F1709729780304%23Picsart_24-03-06_18-25-33-249.jpg?alt=media&token=51277d04-9cf8-4a7b-9497-a12ebd1ae18b',
        title: "Music Player",
        technologies: ["Flutter", "GetX", "HiveDB"],
        techStack: "App Development",
        description: "This is awesome music player ",
        isApp: true,
        gitUrl: "https://github.com/Venkatasai08/myChat",
        link: "https://games-ad414.web.app/",
        order: 2),
    ProjectModel(
        id: "6",
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/mychat-bc5a1.appspot.com/o/mediaUploads%2F1709982036432%23Picsart_24-03-09_16-29-51-569.jpg?alt=media&token=b369a3d7-f469-4a2a-8ac0-dc36e9e005ef',
        title: "Snake game",
        technologies: ["Flutter", 'Supabase', "Provider"],
        techStack: "Flutter Web Development",
        description: "This is my portfolio ",
        isApp: false,
        gitUrl: "https://github.com/Venkatasai08/flutterGames/tree/env_dev",
        link: "https://venkatasai-portfolio.netlify.app/",
        order: 2),
  ];
}
