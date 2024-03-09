import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/globals/app_colors.dart';
import 'package:portfolio/globals/app_text_styles.dart';
import 'package:portfolio/helper%20class/helper_class.dart';
import 'package:portfolio/views/experience.dart';
import 'package:portfolio/views/mySkill.dart';

class SkillsAndExperience extends StatelessWidget {
  const SkillsAndExperience({super.key});

  @override
  Widget build(BuildContext context) {
    FadeInDown buildSkillAndExperienceScreenText() {
      return FadeInDown(
        duration: const Duration(milliseconds: 1200),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 25),
          child: RichText(
            text: TextSpan(
              text: 'Skills',
              style: AppTextStyles.headingStyles(
                  fontSize: 30.0, color: AppColors.robinEdgeBlue),
              children: [
                TextSpan(
                  text: ' & ',
                  style: AppTextStyles.headingStyles(fontSize: 30.0),
                ),
                TextSpan(
                  text: ' Experience',
                  style: AppTextStyles.headingStyles(
                      fontSize: 30.0, color: AppColors.robinEdgeBlue),
                )
              ],
            ),
          ),
        ),
      );
    }

    return HelperClass(
      desktop: Column(
        children: [
          buildSkillAndExperienceScreenText(),
          const SizedBox(),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 80, right: 50),
                  child: SkillsGridView(),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(right: 180),
                    child: ExperienceWidget(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      tablet: Column(
        children: [
          buildSkillAndExperienceScreenText(),
          const SizedBox(),
          const Padding(
            padding: EdgeInsets.only(left: 80, right: 80),
            child: SkillsGridView(),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 40, top: 20, left: 40, bottom: 10),
            child: ExperienceWidget(),
          ),
        ],
      ),
      mobile: Column(
        children: [
          buildSkillAndExperienceScreenText(),
          const SizedBox(),
          const SkillsGridView(
            paddingInImage: 17,
          ),
          const SizedBox(
            height: 20,
          ),
          const ExperienceWidget(),
        ],
      ),
      bgColor: AppColors.bgColor,
      paddingWidth: 2,
    );
  }
}
