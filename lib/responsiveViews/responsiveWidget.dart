import 'package:flutter/material.dart';
import 'package:portfolio/globals/utils.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget destop;
  const ResponsiveWidget(
      {super.key,
      required this.mobile,
      required this.tablet,
      required this.destop});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width < Utils.mobileMaxWidth) {
      return mobile;
    } else if (width > Utils.mobileMaxWidth && width < 1200) {
      return tablet;
    } else {
      return destop;
    }
  }
}
