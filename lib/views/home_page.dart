import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/globals/app_assets.dart';
import 'package:portfolio/globals/app_buttons.dart';
import 'package:portfolio/globals/app_colors.dart';
import 'package:portfolio/globals/app_text_styles.dart';
import 'package:portfolio/globals/constants.dart';
import 'package:portfolio/globals/utils.dart';
import 'package:portfolio/models/headerModel.dart';
import 'package:portfolio/helper%20class/helper_class.dart';

import 'package:path/path.dart' as path;
import 'package:portfolio/provider/dashboardProvider.dart';
import 'package:portfolio/widgets/medialIconsListView.dart';
import 'package:portfolio/widgets/typeWritterEffect.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:html' as html;

class HomePageContentWidget extends StatelessWidget {
  const HomePageContentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final DashboardProvider dashboardProvider = context.read();
    void composeEmail() {
      final Uri emailUri = Uri(
        scheme: 'mailto',
        path: AppAssets.mailLink,
        queryParameters: {
          'subject': 'Someone wants to hire you',
          'body': '''
Greeting of the day 

Company Name :
Location :
Package details :


Any message to me :



Thank you
''',
        },
      );
      html.window.open(emailUri.toString().replaceAll("+", " "), 'Email');
    }

    String themeText =
        '"The ability to improve during problems is in our human blood, \nthis is what make\'s the humans the Ultimate living being,. \nTrust me I can do it much better than this."';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        FadeInRight(
          duration: const Duration(milliseconds: 1400),
          child: Text(
            'Venkatasai Vishwanth',
            style: AppTextStyles.headingStyles(),
          ),
        ),
        Constants.sizedBox(height: 15.0),
        Column(
          // mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TypeWritterEffect(
              dataList: const [
                "Flutter Developer",
                "MERN Stack Developer",
                "Full Stack Developer"
              ],
              style: AppTextStyles.montserratStyle(color: Colors.lightBlue),
            ),
          ],
        ),
        Constants.sizedBox(height: 15.0),
        BounceInRight(
          from: 350,
          child: Text(
            "Gmail : ${AppAssets.mailLink}",
            style: AppTextStyles.normalStyle(),
          ),
        ),
        Constants.sizedBox(height: 15.0),
        BounceInLeft(
          from: 350,
          child: Text(
            themeText,
            style: AppTextStyles.normalStyle(),
          ),
        ),
        Constants.sizedBox(height: 12.0),
        SlideInUp(
          child: Row(
            children: [
              MediaIconWidget(
                  isHorizontal: true,
                  index: 2,
                  image: AppAssets.mail,
                  link: AppAssets.mailLink),
              AppButtons.buildMaterialButton(
                  onTap: () {
                    composeEmail();
                    // dashboardProvider.scrollTo(
                    //     index: dashboardProvider.menuItems.length - 1);
                  },
                  buttonName: 'Hire Me'),
            ],
          ),
        ),
      ],
    );
  }
}
