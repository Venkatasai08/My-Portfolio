import 'package:flutter/material.dart';
import 'package:portfolio/globals/app_assets.dart';
import 'package:portfolio/globals/app_colors.dart';
import 'package:portfolio/globals/constants.dart';
import 'package:portfolio/models/headerModel.dart';
import 'package:url_launcher/url_launcher.dart';

class IconsListViewWidget extends StatefulWidget {
  final Axis axis;
  const IconsListViewWidget({
    super.key,
    this.axis = Axis.vertical,
  });

  @override
  State<IconsListViewWidget> createState() => _IconsListViewWidgetState();
}

class _IconsListViewWidgetState extends State<IconsListViewWidget> {
  final List<MediaModel> socialButtons = <MediaModel>[
    // MediaModel(image: AppAssets.facebook, link: AppAssets.facebookLink),
    // MediaModel(image: AppAssets.twitter, link: AppAssets.twitterLink),
    MediaModel(image: AppAssets.linkedIn, link: AppAssets.linkedInLInk),
    // MediaModel(image: AppAssets.insta, link: AppAssets.instaLink),
    MediaModel(image: AppAssets.github, link: AppAssets.githubLink),
    // AppAssets.facebook,
    // AppAssets.twitter,
    // AppAssets.linkedIn,
    // AppAssets.insta,
    // AppAssets.github,
  ];

  int? socialBI;

  @override
  Widget build(BuildContext context) {
    bool isHorizontal = widget.axis == Axis.horizontal;

    return SizedBox(
      width: isHorizontal ? null : 68,
      height: isHorizontal ? 68 : null,
      child: ListView.builder(
        itemCount: socialButtons.length,
        shrinkWrap: true,
        scrollDirection: widget.axis,
        // separatorBuilder: (context, child) => Constants.sizedBox(width: 15.0),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () async {
                Uri url = Uri.parse(socialButtons[index].link);
                bool isLaunchable = await canLaunchUrl(url);
                if (isLaunchable) {
                  launchUrl(url);
                }
              },
              onHover: (value) {
                setState(() {
                  if (value) {
                    socialBI = index;
                  } else {
                    socialBI = null;
                  }
                });
              },
              borderRadius: BorderRadius.circular(550.0),
              hoverColor: AppColors.themeColor,
              splashColor: AppColors.lawGreen,
              child: Container(
                width: isHorizontal ? 45 : 35,
                height: isHorizontal ? 45 : 35,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.themeColor, width: 2.0),
                  color: socialBI != index
                      ? Colors.transparent
                      : AppColors.themeColor,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(8),
                child: Image.network(
                  socialButtons[index].image,
                  width: 10,
                  height: 12,
                  color: socialBI == index
                      ? AppColors.bgColor
                      : AppColors.themeColor,
                  // fit: BoxFit.fill,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class StackMediaIcons extends StatelessWidget {
  final bool isIconsVisible;
  final Widget child;
  const StackMediaIcons({
    super.key,
    required this.child,
    this.isIconsVisible = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        child,
        isIconsVisible
            ? const Padding(
                padding: EdgeInsets.only(right: 35, bottom: 20, left: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconsListViewWidget(
                      axis: Axis.vertical,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "@2023 VENKATASAI",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "ALL RIGHTS RESERVED",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    )
                  ],
                ),
              )
            : const SizedBox()
      ],
    );
  }
}
