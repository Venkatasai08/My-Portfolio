import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:portfolio/globals/app_assets.dart';
import 'package:portfolio/globals/app_colors.dart';
import 'package:portfolio/main_dashboard.dart';
import 'package:portfolio/models/browserDataModel.dart';
import 'package:portfolio/provider/dashboardProvider.dart';
import 'package:portfolio/provider/myServicesProvider.dart';
import 'package:portfolio/provider/projectsProvider.dart';
import 'package:portfolio/provider/skillsProvider.dart';
import 'package:portfolio/session/sessionManager.dart';
import 'package:portfolio/supabaseServices/dashboardService.dart';
import 'package:provider/provider.dart';

class LoaderScreen extends StatefulWidget {
  const LoaderScreen({super.key});

  @override
  State<LoaderScreen> createState() => _LoaderScreenState();
}

class _LoaderScreenState extends State<LoaderScreen> {
  late DashboardProvider dashboardProvider;
  late SkillProvider skillProvider;
  late ProjectsProvider projectsProvider;
  late ServicesProvider servicesProvider;
  final DashboardApi dashboardApi = DashboardApi();
  Timer? timer;
  @override
  void initState() {
    super.initState();
    dashboardProvider = context.read();
    skillProvider = context.read();
    projectsProvider = context.read();
    servicesProvider = context.read();
    initMethod();
  }

  initMethod() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      dashboardApi.getPortfolioViewCount().listen((event) {
        dashboardProvider.changeDetails(event);
      });
    });
    await updateDeviceData();
    await projectsProvider.getProjects();
    await skillProvider.getSkills();
    await skillProvider.getExperience();
    await servicesProvider.getServices();
    // await dashboardProvider.changeWorkedLogos();
    // await Future.delayed(const Duration(seconds: 1));
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MainDashBoard(),
        ),
      );
    }
  }

  updateDeviceData() async {
    bool? key = await SessionManager.getTheKey();
    if (key == null) {
      BrowserDataModel data = await SessionManager.getDeviceInfo();
      dashboardApi.saveDeviceInfo(data);
      dashboardApi.updateCount();
      SessionManager.setTheKey();
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor2,
      body: Center(
        child: Lottie.asset(AppAssets.loader, height: 200, width: 200),
      ),
    );
  }
}
