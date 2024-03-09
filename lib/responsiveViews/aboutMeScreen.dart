import 'package:flutter/material.dart';
import 'package:portfolio/globals/app_colors.dart';
import 'package:portfolio/globals/constants.dart';
import 'package:portfolio/helper%20class/helper_class.dart';
import 'package:portfolio/views/about_me.dart';

class AboutMeScreen extends StatelessWidget {
  const AboutMeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
      mobile: Column(
        children: [
          const ProfilePictureWidget(),
          Constants.sizedBox(height: 35.0),
          const AboutMeWidget(),
          const AboutMeContentWidget(),
        ],
      ),
      tablet: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Row(
            children: [
              ProfilePictureWidget(),
              SizedBox(
                width: 10,
              ),
              Flexible(child: AboutMeWidget()),
            ],
          ),
          Constants.sizedBox(width: 25.0),
          const AboutMeContentWidget()
        ],
      ),
      desktop: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const ProfilePictureWidget(),
          Constants.sizedBox(width: 25.0),
          const Expanded(
              child: Column(
            children: [
              AboutMeWidget(),
              AboutMeContentWidget(),
            ],
          ))
        ],
      ),
      paddingWidth: size.width * 0.05,
      bgColor: AppColors.bgColor2,
    );
  }
}
