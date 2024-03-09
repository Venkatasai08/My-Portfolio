import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/globals/app_colors.dart';
import 'package:portfolio/globals/app_text_styles.dart';
import 'package:portfolio/globals/constants.dart';
import 'package:portfolio/helper%20class/helper_class.dart';
import 'package:portfolio/views/home_page.dart';
import 'package:portfolio/widgets/profile_animation.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    Widget ItsMeWidget() {
      return Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: FadeInDown(
          duration: const Duration(milliseconds: 1200),
          child: Text(
            'Hello, It\'s Me',
            style: AppTextStyles.montserratStyle(color: Colors.white),
          ),
        ),
      );
    }

    return HelperClass(
      shouldIconsVisible: false,
      mobile: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ItsMeWidget(),
          const ProfileAnimation(),
          Constants.sizedBox(height: 45.0),
          const HomePageContentWidget(),
        ],
      ),
      tablet: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ItsMeWidget(),
              const HomePageContentWidget(),
            ],
          )),
          const ProfileAnimation(),
        ],
      ),
      desktop: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ItsMeWidget(),
              const HomePageContentWidget(),
            ],
          )),
          const ProfileAnimation(),
        ],
      ),
      paddingWidth: size.width * 0.05,
      bgColor: Colors.transparent,
    );
  }
}
