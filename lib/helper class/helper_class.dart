import 'package:flutter/material.dart';
import 'package:portfolio/globals/utils.dart';
import 'package:portfolio/widgets/medialIconsListView.dart';

class HelperClass extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;
  final double paddingWidth;
  final Color bgColor;
  final bool shouldIconsVisible;
  const HelperClass(
      {Key? key,
      required this.mobile,
      required this.tablet,
      required this.desktop,
      required this.paddingWidth,
      required this.bgColor,
      this.shouldIconsVisible = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      alignment: Alignment.center,
      color: bgColor,
      child: StackMediaIcons(
        isIconsVisible: shouldIconsVisible,
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < Utils.mobileMaxWidth) {
              return Container(
                // height: size.height,

                padding: EdgeInsets.symmetric(
                    vertical: size.height * 0.05, horizontal: 18),
                child: mobile,
              );
            } else if (constraints.maxWidth < 1200) {
              return Container(
                // height: size.height,

                padding: EdgeInsets.symmetric(
                    vertical: size.height * 0.1, horizontal: paddingWidth),
                child: tablet,
              );
            } else {
              return ConstrainedBox(
                constraints: BoxConstraints(minHeight: size.height),
                child: Container(
                  // height: size.height,

                  padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.1,
                      horizontal: paddingWidth + 50),
                  child: desktop,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
