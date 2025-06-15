import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:portfolio/globals/app_assets.dart';
import 'package:portfolio/globals/app_colors.dart';
import 'package:portfolio/globals/constants.dart';
import 'package:portfolio/globals/utils.dart';
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
          return MediaIconWidget(
            image: socialButtons[index].image,
            isHorizontal: isHorizontal,
            index: index,
            link: socialButtons[index].link,
          );
        },
      ),
    );
  }
}

class MediaIconWidget extends StatefulWidget {
  const MediaIconWidget({
    super.key,
    required this.isHorizontal,
    required this.index,
    required this.image,
    required this.link,
  });

  final bool isHorizontal;
  final int index;
  final String image;
  final String link;

  @override
  State<MediaIconWidget> createState() => _MediaIconWidgetState();
}

class _MediaIconWidgetState extends State<MediaIconWidget> {
  int? socialBI;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () async {
          if (widget.link == AppAssets.mailLink) {
            Utils.copy(
                textToCopy: widget.link, messageAfterCopy: "Mail copied");
          } else {
            Uri url = Uri.parse(widget.link);
            bool isLaunchable = await canLaunchUrl(url);
            if (isLaunchable) {
              launchUrl(url);
            }
          }
        },
        onHover: (value) {
          setState(() {
            if (value) {
              socialBI = widget.index;
            } else {
              socialBI = null;
            }
          });
        },
        onLongPress: () async {
          Utils.copy(textToCopy: widget.link);
        },
        borderRadius: BorderRadius.circular(550.0),
        hoverColor: AppColors.themeColor,
        splashColor: AppColors.lawGreen,
        child: Container(
          width: widget.isHorizontal ? 45 : 35,
          height: widget.isHorizontal ? 45 : 35,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.themeColor, width: 2.0),
            color: socialBI != widget.index
                ? Colors.transparent
                : AppColors.themeColor,
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(8),
          child: Image.network(
            widget.image,
            width: 10,
            height: 12,
            color: socialBI == widget.index
                ? AppColors.bgColor
                : AppColors.themeColor,
            // fit: BoxFit.fill,
          ),
        ),
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
            ? const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CopyRightsWidget(),
                ],
              )
            : const SizedBox()
      ],
    );
  }
}

class CopyRightsWidget extends StatelessWidget {
  const CopyRightsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      "@2023 VENKATASAI ALL RIGHTS RESERVED",
      style: TextStyle(color: Colors.white),
    );
  }
}
