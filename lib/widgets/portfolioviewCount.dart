import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/globals/app_colors.dart';
import 'package:portfolio/globals/app_text_styles.dart';
import 'package:portfolio/globals/utils.dart';
import 'package:portfolio/provider/dashboardProvider.dart';
import 'package:provider/provider.dart';

class PortfolioViewCountWidget extends StatelessWidget {
  const PortfolioViewCountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Tooltip(
        message: "Portfolio view count",
        child: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white), shape: BoxShape.circle),
          child: Consumer<DashboardProvider>(builder: (context, value, child) {
            return FittedBox(
              child: Text(
                  Utils.convertToKandM(
                      count: value.userDetailsModel.count, decimalPoints: 0),
                  style: const TextStyle(color: Colors.white, fontSize: 18)),
            );
          }),
        ),
      ),
    );
  }
}
