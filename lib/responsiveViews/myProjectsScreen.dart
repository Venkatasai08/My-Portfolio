import 'package:flutter/material.dart';
import 'package:portfolio/globals/app_colors.dart';
import 'package:portfolio/globals/constants.dart';
import 'package:portfolio/helper%20class/helper_class.dart';
import 'package:portfolio/views/my_portfolio.dart';

class MyProjectsScreen extends StatelessWidget {
  const MyProjectsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
      mobile: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 15,
            ),
            const LatestProjectTextWidget(),
            Constants.sizedBox(height: 40.0),
            const ProjectsGridWidget(crossAxisCount: 1)
          ],
        ),
      ),
      tablet: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const LatestProjectTextWidget(),
          Constants.sizedBox(height: 40.0),
          const ProjectsGridWidget(crossAxisCount: 2)
        ],
      ),
      desktop: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const LatestProjectTextWidget(),
          Constants.sizedBox(height: 40.0),
          const ProjectsGridWidget(crossAxisCount: 3),
        ],
      ),
      paddingWidth: size.width * 0.1,
      bgColor: AppColors.bgColor2,
    );
  }
}
