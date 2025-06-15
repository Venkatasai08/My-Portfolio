import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/globals/app_assets.dart';
import 'package:portfolio/globals/app_colors.dart';
import 'package:portfolio/globals/constants.dart';
import 'package:portfolio/provider/dashboardProvider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

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
    final DashboardProvider dashboardProvider = context.read();
    Future<void> launchPDF() async {
      // Load the PDF file from assets
      var bytes = await rootBundle.load(AppAssets.resume);
      final blob = html.Blob([bytes.buffer.asUint8List()], 'application/pdf');
      final url = html.Url.createObjectUrlFromBlob(blob);

      // Open the PDF file in a new tab
      html.window.open(url, '_blank');
    }

    void downloadPDF(String downloadUrl) async {
      var response = await http.get(Uri.parse(downloadUrl));
      if (response.statusCode == 200) {
        final blob = html.Blob([response.bodyBytes], 'application/pdf');
        final url = html.Url.createObjectUrlFromBlob(blob);
        // final anchor = html.AnchorElement(href: url)
        //   ..setAttribute("download", "sample.pdf")
        //   ..click();
        // html.Url.revokeObjectUrl(url);
        html.window.open(url, '_blank');
      } else {
        // Handle errors
        print('Failed to download PDF: ${response.statusCode}');
      }
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
                String downloadUrl = dashboardProvider.userDetailsModel.resume;
                if (downloadUrl.isEmpty) {
                  launchPDF();
                } else {
                  downloadPDF(downloadUrl);
                }
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
    return SlideInLeft(
      duration: const Duration(milliseconds: 1200),
      child: Consumer<DashboardProvider>(builder: (context, value, child) {
        return Image.network(
          value.userDetailsModel.secondProfilePic.isEmpty
              ? "https://res.cloudinary.com/dytmxozk2/image/upload/v1749725237/secondImage_iem9wj.png"
              : value.userDetailsModel.secondProfilePic,
          height: size,
          width: size,
        );
      }),
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
        FadeInDown(
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
        FadeInRight(
          child: Text(
            '         Well qualified Full Stack Developer familiar with wide range of programming utilities and languages. '
            'Knowledge of backend and frontend development requirements.Handle any part of process with ease.'
            'Collaborative team player with excellent technical abilities offering $experienceText of related experience.\n',
            style: AppTextStyles.normalStyle(),
          ),
        ),
      ],
    );
  }
}
