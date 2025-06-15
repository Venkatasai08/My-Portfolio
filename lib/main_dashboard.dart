import 'package:flutter/material.dart';
import 'package:portfolio/constants/appKeys.dart';
import 'package:portfolio/globals/app_text_styles.dart';
import 'package:portfolio/globals/utils.dart';
import 'package:portfolio/models/browserDataModel.dart';
import 'package:portfolio/models/headerModel.dart';
import 'package:portfolio/provider/dashboardProvider.dart';
import 'package:portfolio/session/sessionManager.dart';
import 'package:portfolio/supabaseServices/dashboardService.dart';
import 'package:portfolio/supabaseServices/projectsService.dart';
import 'package:portfolio/supabaseServices/skilllsService.dart';

import 'package:portfolio/widgets/appBarWidget.dart';
import 'package:portfolio/widgets/medialIconsListView.dart';
import 'package:provider/provider.dart';
import 'globals/app_colors.dart';

class MainDashBoard extends StatefulWidget {
  const MainDashBoard({Key? key}) : super(key: key);

  @override
  _MainDashBoardState createState() => _MainDashBoardState();
}

class _MainDashBoardState extends State<MainDashBoard> {
  late DashboardProvider dashboardProvider;
  final DashboardApi dashboardApi = DashboardApi();
  final SkillsService skillsService = SkillsService();
  // final ItemPositionsListener itemPositionsListener =
  //     ItemPositionsListener.create();
  // final ScrollOffsetListener scrollOffsetListener =
  //     ScrollOffsetListener.create();

  @override
  void initState() {
    super.initState();
    dashboardProvider = context.read();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (MediaQuery.of(context).size.width < 1000) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            duration: Duration(seconds: 5),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
            content: Text("View in desktop for better experience.")));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      key: scaffoldKeyForDashboard,
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Row(
            children: [
              Consumer<DashboardProvider>(builder: (context, value, chi) {
                return AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  width: value.isSidebarOpen ? 80 : 0,
                  child: const SideBarWidget(),
                );
              }),
              Container(
                height: size.height,
                width: 0.5,
                decoration: BoxDecoration(color: Colors.grey, boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.3),
                      blurRadius: 5,
                      spreadRadius: 5,
                      offset: const Offset(1, 0)),
                ]),
              ),
              Expanded(
                child: Scrollbar(
                  trackVisibility: true,
                  thumbVisibility: true,
                  thickness: 8,
                  interactive: true,
                  controller: dashboardProvider.yourScrollController,
                  child: SingleChildScrollView(
                    controller: dashboardProvider.yourScrollController,
                    child: Consumer<DashboardProvider>(
                        builder: (context, value, chi) {
                      HeaderModel headerModel =
                          value.menuItems[value.selectedIndex];
                      return Column(
                        children: [
                          value.selectedIndex == 0
                              ? const SizedBox()
                              : Container(
                                  color: value.selectedIndex % 2 == 0
                                      ? AppColors.bgColor
                                      : AppColors.bgColor2,
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 40,
                                      ),
                                      Flexible(
                                        child: Text(
                                          'Venkatasai Vishwanth',
                                          style: AppTextStyles.headingStyles(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                          SizedBox(
                            key: headerModel.key,
                            child: headerModel.child,
                          ),
                        ],
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
          size.width > Utils.mobileMaxWidth
              ? const SizedBox()
              : Positioned(
                  top: 10,
                  left: -3,
                  child: Consumer<DashboardProvider>(
                      builder: (context, value, chi) {
                    return AnimatedPadding(
                      duration: const Duration(seconds: 1),
                      padding:
                          EdgeInsets.only(left: value.isSidebarOpen ? 80 : 0),
                      child: GestureDetector(
                        onTap: () {
                          dashboardProvider.changeIsSidebarOpen();
                        },
                        child: Card(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(5),
                                  bottomRight: Radius.circular(5))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 10),
                            child: Icon(
                              value.isSidebarOpen
                                  ? Icons.arrow_back_ios_new
                                  : Icons.arrow_forward_ios,
                              size: 13,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                )
        ],
      ),
    );
  }
}
