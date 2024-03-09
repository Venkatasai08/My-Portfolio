import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/globals/app_assets.dart';
import 'package:portfolio/globals/app_colors.dart';
import 'package:portfolio/globals/constants.dart';
import 'package:portfolio/helper%20class/helper_class.dart';

import '../globals/app_buttons.dart';
import '../globals/app_text_styles.dart';
import 'dart:html' as html;
import 'package:flutter/services.dart' show rootBundle;

class AboutMeContentWidget extends StatelessWidget {
  const AboutMeContentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Future<void> launchPDF() async {
      // Load the PDF file from assets
      final bytes = await rootBundle.load(AppAssets.resume);
      final blob = html.Blob([bytes.buffer.asUint8List()], 'application/pdf');
      final url = html.Url.createObjectUrlFromBlob(blob);

      // Open the PDF file in a new tab
      html.window.open(url, '_blank');
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        FadeInLeft(
          duration: const Duration(milliseconds: 1600),
          child: Text(
            '         Passionate coder. Eager to use analytical and critical thinking to solve problems,and optimize solutions to active team goals.'
            'Aiming to implement knowledge of web development, mobile app development and programming skills to solve real world problems.'
            'Looking farword developing skills in the industry to be ready for corporate world challenges.'
            'About mu strengths... My strengths are my positive thoughts,my way of thinking, my confidence, I can work under pressure and lastly I am a smart worker.',
            style: AppTextStyles.normalStyle(),
          ),
        ),
        Constants.sizedBox(height: 15.0),
        FadeInUp(
          duration: const Duration(milliseconds: 1800),
          child: AppButtons.buildMaterialButton(
              onTap: () {
                launchPDF();
              },
              buttonName: 'Download CV'),
        )
      ],
    );
  }
}

class ProfilePictureWidget extends StatelessWidget {
  final double size;
  const ProfilePictureWidget({
    super.key,
    this.size = 400,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      duration: const Duration(milliseconds: 1200),
      child: Image.network(
        "https://firebasestorage.googleapis.com/v0/b/mychat-bc5a1.appspot.com/o/mediaUploads%2F1709990910327%23Picsart_24-03-09_18-58-15-776.png?alt=media&token=c1015f17-3b6a-469c-8573-0f25109eb9e7",
        height: size,
        width: size,
      ),
    );
  }
}

class AboutMeWidget extends StatelessWidget {
  const AboutMeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime startedWorkingDate = DateTime(2021, 11, 1);
    DateTime currentDate = DateTime.now();
    List<int> calculateExperience() {
      DateTime startDate = startedWorkingDate;
      DateTime endDate = currentDate;
      int years = endDate.year - startDate.year;
      int months = (endDate.month - startDate.month);
      if (months < 0) {
        months = 12 + months;
        years = years - 1;
      }

      int experience = years * 12 + months;
      return [years, months];
    }

    List<int> experience = calculateExperience();
    String experienceText =
        "${experience[0]} years and ${experience[1]} months";
    if (experience[1] == 0) {
      experienceText = "${experience[0]} years";
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        FadeInRight(
          duration: const Duration(milliseconds: 1200),
          child: RichText(
            text: TextSpan(
              text: 'About ',
              style: AppTextStyles.headingStyles(fontSize: 30.0),
              children: [
                TextSpan(
                  text: 'Me!',
                  style: AppTextStyles.headingStyles(
                      fontSize: 30, color: AppColors.robinEdgeBlue),
                )
              ],
            ),
          ),
        ),
        Constants.sizedBox(height: 6.0),
        FadeInLeft(
          duration: const Duration(milliseconds: 1400),
          child: Text(
            'Developer!',
            style: AppTextStyles.montserratStyle(color: Colors.white),
          ),
        ),
        Constants.sizedBox(height: 8.0),
        Text(
          '         Well qualified Full Stack Developer familiar with wide range of programming utilities and languages. '
          'Knowledge of backend and frontend development requirements.Handle any part of process with ease.'
          'Collaborative team player with excellent technical abilities offering $experienceText of related experience.\n',
          style: AppTextStyles.normalStyle(),
        ),
      ],
    );
  }
}
