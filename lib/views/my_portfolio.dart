import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/globals/app_assets.dart';
import 'package:portfolio/helper%20class/helper_class.dart';
import 'package:portfolio/models/projectsModel.dart';
import 'package:portfolio/provider/projectsProvider.dart';
import 'package:portfolio/widgets/projectCard.dart';
import 'package:provider/provider.dart';

import '../globals/app_colors.dart';
import '../globals/app_text_styles.dart';
import '../globals/constants.dart';

class LatestProjectTextWidget extends StatelessWidget {
  const LatestProjectTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      duration: const Duration(milliseconds: 1200),
      child: RichText(
        text: TextSpan(
          text: 'My ',
          style: AppTextStyles.headingStyles(fontSize: 28.0),
          children: [
            TextSpan(
              text: 'Portfolio',
              style: AppTextStyles.headingStyles(
                  fontSize: 28, color: AppColors.robinEdgeBlue),
            )
          ],
        ),
      ),
    );
  }
}

class ProjectsGridWidget extends StatefulWidget {
  const ProjectsGridWidget({
    super.key,
    required this.crossAxisCount,
  });

  final int crossAxisCount;

  @override
  State<ProjectsGridWidget> createState() => _ProjectsGridWidgetState();
}

class _ProjectsGridWidgetState extends State<ProjectsGridWidget> {
  late ProjectsProvider projectsProvider;
  @override
  void initState() {
    super.initState();
    projectsProvider = context.read();
  }

  int? hoveredIndex;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<ProjectsProvider>(builder: (context, value, ch) {
      return GridView.builder(
        itemCount: value.projects.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: widget.crossAxisCount,
          mainAxisExtent: 380,
          mainAxisSpacing: 24,
          crossAxisSpacing: 24,
        ),
        itemBuilder: (context, index) {
          ProjectModel projectModel = value.projects[index];
          return FadeInUpBig(
            duration: const Duration(milliseconds: 1600),
            child: InkWell(
              onTap: () {},
              onHover: (value) {
                if (size.width > 1200) {
                  setState(() {
                    if (value) {
                      hoveredIndex = index;
                    } else {
                      hoveredIndex = null;
                    }
                  });
                }
              },
              child: Stack(
                children: [
                  ProjectCard(
                      projectModel: projectModel,
                      hoveredIndex: hoveredIndex,
                      index: index),
                  size.width < 1200
                      ? Positioned(
                          top: 15,
                          right: 15,
                          child: IconButton(
                              onPressed: () {
                                if (hoveredIndex == index) {
                                  hoveredIndex = null;
                                } else {
                                  hoveredIndex = index;
                                }
                                setState(() {});
                              },
                              icon: const Icon(Icons.view_agenda)),
                        )
                      : const SizedBox()
                ],
              ),
            ),
          );
        },
      );
    });
  }
}
