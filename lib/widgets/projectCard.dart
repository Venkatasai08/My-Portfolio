import 'package:flutter/material.dart';
import 'package:portfolio/globals/app_colors.dart';
import 'package:portfolio/models/projectsModel.dart';
import 'package:portfolio/widgets/projectCardAnimation.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard(
      {super.key,
      required this.projectModel,
      required this.hoveredIndex,
      required this.index});

  final ProjectModel projectModel;
  final int? hoveredIndex;
  final int index;

  @override
  Widget build(BuildContext context) {
    String technologies = "";
    for (var element in projectModel.technologies) {
      technologies = "$technologies, $element";
    }
    technologies = technologies.replaceFirst(",", "");
    return Transform.scale(
      scale: index == hoveredIndex ? 1.02 : 1,
      child: Container(
        padding: const EdgeInsets.all(10),
        // transform: ,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.white,
          boxShadow: index == hoveredIndex
              ? [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 10,
                      blurRadius: 5),
                ]
              : [],
        ),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.hardEdge,
                  children: [
                    Column(
                      children: [
                        Expanded(
                          child: Image.network(
                            projectModel.imageUrl,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              }
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) {
                              debugPrint("$stackTrace error in image");
                              return const Center(
                                child: Icon(
                                  Icons.error,
                                  color: Colors.black,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: index == hoveredIndex,
                      child: SlideTransitionProjectWidget(
                          projectModel: projectModel),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              projectModel.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 40,
              child: Text(
                technologies,
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
