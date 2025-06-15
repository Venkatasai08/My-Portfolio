import 'package:flutter/material.dart';

class CustomCarousel extends StatelessWidget {
  final Function(int)? onPageChanged;
  final PageController controller;
  final int? itemCount;
  final Function(BuildContext, int) itemBuilder;
  const CustomCarousel(
      {super.key,
      required this.onPageChanged,
      required this.controller,
      this.itemCount,
      required this.itemBuilder});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      onPageChanged: onPageChanged,
      controller: controller,
      scrollDirection: Axis.horizontal,

      itemCount: itemCount, // Number of pages
      itemBuilder: (context, index) {
        return AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            double value = 1.0;
            // Determine the position of the current page
            try {
              if (controller.position.haveDimensions) {
                value = (controller.page ?? 0) - index;
                value = (1 - (value.abs() * 0.3)).clamp(0.7, 1.0);
              }
            } catch (e) {}

            return Transform.scale(
              scale: value,
              child: child,
            );
          },
          child: Align(
            alignment: Alignment.center,
            child: itemBuilder(context, index),
          ),
        );
      },
    );
  }
}
