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
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePageContentWidget extends StatelessWidget {
  const HomePageContentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final DashboardProvider dashboardProvider = context.read();
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
            AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  'Flutter Developer',
                  textStyle:
                      AppTextStyles.montserratStyle(color: Colors.lightBlue),
                ),
                TyperAnimatedText('MERN Stack Developer ',
                    textStyle:
                        AppTextStyles.montserratStyle(color: Colors.lightBlue)),
                TyperAnimatedText('Full Stack Developer',
                    textStyle:
                        AppTextStyles.montserratStyle(color: Colors.lightBlue)),
              ],
              pause: const Duration(milliseconds: 1000),
              displayFullTextOnTap: true,
              stopPauseOnTap: true,
            )
          ],
        ),
        Constants.sizedBox(height: 15.0),
        Text(
          themeText,
          style: AppTextStyles.normalStyle(),
        ),
        Constants.sizedBox(height: 12.0),
        const IconsListViewWidget(
          axis: Axis.horizontal,
        ),
        Constants.sizedBox(height: 8.0),
        AppButtons.buildMaterialButton(
            onTap: () {
              dashboardProvider.scrollTo(
                  index: dashboardProvider.menuItems.length - 1);
            },
            buttonName: 'Hire Me'),
      ],
    );
  }
}
