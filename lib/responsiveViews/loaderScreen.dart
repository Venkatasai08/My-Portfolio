import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:portfolio/globals/app_assets.dart';
import 'package:portfolio/globals/app_colors.dart';
import 'package:portfolio/main_dashboard.dart';

class LoaderScreen extends StatefulWidget {
  const LoaderScreen({super.key});

  @override
  State<LoaderScreen> createState() => _LoaderScreenState();
}

class _LoaderScreenState extends State<LoaderScreen> {
  Timer? timer;
  @override
  void initState() {
    super.initState();
    timer = Timer(
      const Duration(seconds: 3),
      () {
        timer?.cancel();
        Navigator.pushReplacement(
            context,
            PageTransition(
                child: const MainDashBoard(), type: PageTransitionType.fade));
      },
    );
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
