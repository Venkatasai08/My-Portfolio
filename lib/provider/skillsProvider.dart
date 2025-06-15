import 'package:flutter/material.dart';
import 'package:portfolio/models/experienceModel.dart';
import 'package:portfolio/models/skillsModel.dart';
import 'package:portfolio/supabaseServices/skilllsService.dart';

class SkillProvider extends ChangeNotifier {
  int? hoverIndex;
  List<SkillModel> mySkills = [];
  SkillsService service = SkillsService();

  getSkills() async {
    List<SkillModel> data = await service.getSkills();
    mySkills = data;
    notifyListeners();
  }

  changeHoverINdex(int? index) {
    hoverIndex = index;
    notifyListeners();
  }

  static int currentTimestamp = DateTime.now().millisecondsSinceEpoch;
  List<ExperienceModel> experienceList = [];
  getExperience() async {
    List<ExperienceModel> data = await service.getExperience();
    experienceList = data;
    notifyListeners();
  }

  int selectedExperience = 0;
  changeSelectedExperience(int index) {
    selectedExperience = index;
    notifyListeners();
  }
}
