import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:portfolio/globals/app_colors.dart';

class GlassMorphic extends StatelessWidget {
  final Widget child;
  final Alignment alignment;
  final BorderRadius? borderRadius;
  const GlassMorphic(
      {super.key,
      required this.child,
      this.alignment = Alignment.center,
      this.borderRadius});

  @override
  Widget build(BuildContext context) {
    final borderRadiusArg = borderRadius ?? BorderRadius.circular(15);
    return ClipRRect(
      borderRadius: borderRadiusArg,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: borderRadiusArg,
          border: Border.all(
            color: Colors.white.withOpacity(0.55),
            width: 1,
          ),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.white.withOpacity(0.3),
              AppColors.white.withOpacity(0.15),
            ],
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Blur background
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white.withOpacity(0.05),
                  // borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            // Content inside the card
            child,
          ],
        ),
      ),
    );
  }
}
