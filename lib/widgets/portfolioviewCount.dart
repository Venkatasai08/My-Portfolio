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
    final Size size = MediaQuery.of(context).size;
    DashboardProvider dashboardProvider = context.read();

    return Padding(
      padding: EdgeInsets.only(
          top: size.width < Utils.mobileMaxWidth ? 10 : 0, left: 20),
      child: Row(
        children: [
          Tooltip(
            message: "Portfolio view count",
            child:
                Consumer<DashboardProvider>(builder: (context, value, child) {
              return Text(
                  Utils.convertToKandM(
                      count: value.viewedCount, decimalPoints: 0),
                  style: const TextStyle(color: Colors.white, fontSize: 18));
            }),
          ),
          const SizedBox(
            width: 20,
          ),
          GestureDetector(
            onTap: () {
              dashboardProvider.scrollTo(index: 0);
            },
            child: Text(
              'VENKATA SAI ',
              style: GoogleFonts.dancingScript(color: Colors.white),
            ),
          ),

          // size.width < 789
          //     ? const SizedBox()
          //     : Text(
          //         "Viewed",
          //         style: AppTextStyles.headerTextStyle(color: AppColors.white),
          //       )
        ],
      ),
    );
  }
}
