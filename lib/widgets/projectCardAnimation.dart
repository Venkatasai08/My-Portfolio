import 'package:flutter/material.dart';
import 'package:portfolio/globals/app_assets.dart';
import 'package:portfolio/globals/app_colors.dart';
import 'package:portfolio/globals/app_text_styles.dart';
import 'package:portfolio/globals/constants.dart';
import 'package:portfolio/models/projectsModel.dart';
import 'package:universal_html/html.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

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

  @override
  Widget build(BuildContext context) {
    // final onH0verEffect = Matrix4.identity()..scale(1.0);

    return FadeTransition(
      opacity: fadeAnimation,
      child: SlideTransition(
          position: animation,
          child: ProjectBackCard(projectModel: widget.projectModel)),
    );
  }
}

class ProjectBackCard extends StatelessWidget {
  final ProjectModel projectModel;
  const ProjectBackCard({super.key, required this.projectModel});
  void downloadApk(String apkUrl) async {
    // Fetch the APK file
    var response = await http.get(Uri.parse(apkUrl));

    // Convert the response body into bytes
    var bytes = response.bodyBytes;

    // Create a Blob object from the bytes
    var blob = Blob([bytes]);

    // Create an anchor element
    var anchor = AnchorElement(href: Url.createObjectUrlFromBlob(blob))
      ..setAttribute("download", "your_app.apk")
      ..style.display = 'none';

    // Append the anchor element to the body
    document.body!.children.add(anchor);

    // Trigger the download
    anchor.click();

    // Clean up
    document.body!.children.remove(anchor);
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
    return Container(
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
                  projectModel.techStack,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.montserratStyle(
                      color: Colors.white, fontSize: 20),
                ),
                Constants.sizedBox(height: 15.0),
                Text(
                  projectModel.description,
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
              projectModel.isApp
                  ? GestureDetector(
                      onTap: () {
                        if (projectModel.link.isNotEmpty) {
                          downloadApk(projectModel.link);
                        }
                      },
                      child: const CircleAvatar(
                        maxRadius: 25,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.download,
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        urlLaunch(projectModel.link);
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
                  urlLaunch(projectModel.gitUrl);
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
    );
  }
}
