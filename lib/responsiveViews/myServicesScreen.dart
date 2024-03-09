import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/globals/app_assets.dart';
import 'package:portfolio/globals/app_buttons.dart';
import 'package:portfolio/globals/app_colors.dart';
import 'package:portfolio/globals/constants.dart';
import 'package:portfolio/helper%20class/helper_class.dart';
import 'package:portfolio/provider/myServicesProvider.dart';
import 'package:portfolio/views/services_card.dart';
import 'package:portfolio/widgets/serviceToggleButton.dart';
import 'package:portfolio/widgets/workedCompanyLogos.dart';
import 'package:provider/provider.dart';

import '../globals/app_text_styles.dart';

class MyServicesScreen extends StatefulWidget {
  const MyServicesScreen({Key? key}) : super(key: key);

  @override
  State<MyServicesScreen> createState() => _MyServicesScreenState();
}

class _MyServicesScreenState extends State<MyServicesScreen> {
  bool isApp = false, isGraphic = false, isDataAnalyst = false;

  final onHoverActive = Matrix4.identity()..translate(0, -10, 0);
  final onHoverRemove = Matrix4.identity()..translate(0, 0, 0);
  late ServicesProvider servicesProvider;
  @override
  void initState() {
    super.initState();
    servicesProvider = context.read();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    FadeInDown buildMyServicesScreenText() {
      return FadeInDown(
        duration: const Duration(milliseconds: 1200),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 25),
          child: RichText(
            text: TextSpan(
              text: 'My ',
              style: AppTextStyles.headingStyles(fontSize: 30.0),
              children: [
                TextSpan(
                  text: 'Services',
                  style: AppTextStyles.headingStyles(
                      fontSize: 30.0, color: AppColors.robinEdgeBlue),
                )
              ],
            ),
          ),
        ),
      );
    }

    Widget toggleButtons() {
      return Padding(
        padding: const EdgeInsets.only(top: 30, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ServiceToggleButtonWidget(
              iconData: Icons.arrow_back,
              onTap: () {
                servicesProvider.leftClicked();
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child:
                  Consumer<ServicesProvider>(builder: (context, value, child) {
                return Text(
                  "${value.selectedService + 1}",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 15,
                  ),
                );
              }),
            ),
            ServiceToggleButtonWidget(
              iconData: Icons.arrow_forward,
              onTap: () {
                servicesProvider.rightClicked();
              },
            )
          ],
        ),
      );
    }

    return HelperClass(
      desktop: Column(
        children: [
          buildMyServicesScreenText(),
          const ServiceCardWidget(),
          toggleButtons(),
          const SizedBox(
            height: 10,
          ),
          const WorkedCompanyLogos()
        ],
      ),
      mobile: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          buildMyServicesScreenText(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: ServiceCardWidget(),
          ),
          toggleButtons(),
          const SizedBox(
            height: 10,
          ),
          const WorkedCompanyLogos()
        ],
      ),
      tablet: Column(
        children: [
          buildMyServicesScreenText(),
          const ServiceCardWidget(),
          toggleButtons(),
          const SizedBox(
            height: 10,
          ),
          const WorkedCompanyLogos()
        ],
      ),
      bgColor: AppColors.bgColor,
      paddingWidth: size.width * 0.04,
    );
  }
}
