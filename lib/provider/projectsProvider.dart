import 'package:flutter/material.dart';
import 'package:portfolio/models/projectsModel.dart';
import 'package:portfolio/models/serviceModel.dart';
import 'package:portfolio/supabaseServices/dashboardService.dart';
import 'package:portfolio/supabaseServices/projectsService.dart';

class ProjectsProvider extends ChangeNotifier {
  final ProjectsService service = ProjectsService();
  List<ProjectModel> projects = [];
  getProjects() async {
    List<ProjectModel> data = await service.getProjects();
    projects = data;
    notifyListeners();
  }

  List<WorkedLogosModel> logos = [];
}
