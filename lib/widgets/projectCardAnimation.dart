import 'package:flutter/material.dart';
import 'package:portfolio/globals/app_assets.dart';
import 'package:portfolio/globals/app_colors.dart';
import 'package:portfolio/globals/app_text_styles.dart';
import 'package:portfolio/globals/constants.dart';
import 'package:portfolio/models/projectsModel.dart';
import 'package:url_launcher/url_launcher.dart';

class SlideTransitionProjectWidget extends StatefulWidget {
  final ProjectModel projectModel;
  const SlideTransitionProjectWidget({
    super.key,
    required this.projectModel,
  });

  @override
  State<SlideTransitionProjectWidget> createState() =>
      _SlideTransitionProjectWidgetState();
}

class _SlideTransitionProjectWidgetState
    extends State<SlideTransitionProjectWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> animation;
  late Animation<double> fadeAnimation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    animation = Tween(begin: const Offset(0, -1), end: const Offset(0, 0))
        .animate(animationController);

    fadeAnimation = Tween(begin: 0.0, end: 1.0).animate(animationController);

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.reverse();
    animationController.dispose();
    super.dispose();
  }

  urlLaunch(String link) async {
    Uri url = Uri.parse(link);
    bool isLaunchable = await canLaunchUrl(url);
    if (isLaunchable) {
      launchUrl(url);
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    // final onH0verEffect = Matrix4.identity()..scale(1.0);

    return FadeTransition(
      opacity: fadeAnimation,
      child: SlideTransition(
        position: animation,
        child: Container(
          // duration: const Duration(milliseconds: 600),
          // curve: Curves.easeIn,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black.withOpacity(0.8)),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      widget.projectModel.techStack,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.montserratStyle(
                          color: Colors.white, fontSize: 20),
                    ),
                    Constants.sizedBox(height: 15.0),
                    Text(
                      widget.projectModel.description,
                      style: AppTextStyles.normalStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Constants.sizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget.projectModel.isApp
                      ? const CircleAvatar(
                          maxRadius: 25,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.download,
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            urlLaunch(widget.projectModel.link);
                          },
                          child: const CircleAvatar(
                            maxRadius: 25,
                            backgroundColor: Colors.white,
                            child: Icon(Icons.launch),
                          ),
                        ),
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () async {
                      urlLaunch(widget.projectModel.gitUrl);
                    },
                    child: CircleAvatar(
                      maxRadius: 25,
                      backgroundColor: Colors.white,
                      child: Image.network(
                        AppAssets.github,
                        width: 25,
                        height: 25,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
