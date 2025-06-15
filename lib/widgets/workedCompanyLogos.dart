import 'package:flutter/material.dart';
import 'package:portfolio/globals/app_assets.dart';
import 'package:portfolio/provider/dashboardProvider.dart';
import 'package:portfolio/provider/skillsProvider.dart';
import 'package:portfolio/supabaseServices/dashboardService.dart';
import 'package:provider/provider.dart';

class WorkedCompanyLogos extends StatelessWidget {
  const WorkedCompanyLogos({super.key});

  @override
  Widget build(BuildContext context) {
    // return const SizedBox();
    return Consumer<SkillProvider>(
      builder: (context, value, ch) {
        return Wrap(
          runSpacing: 10,
          spacing: 10,
          alignment: WrapAlignment.center,
          children: value.experienceList
              .map(
                (e) => SizedBox(
                  height: 100,
                  child: Image.network(
                    e.companyImage,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }
}
