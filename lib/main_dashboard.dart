import 'package:flutter/material.dart';
import 'package:portfolio/globals/utils.dart';
import 'package:portfolio/models/browserDataModel.dart';
import 'package:portfolio/models/headerModel.dart';
import 'package:portfolio/provider/dashboardProvider.dart';
import 'package:portfolio/session/sessionManager.dart';
import 'package:portfolio/supabaseServices/dashboardService.dart';

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
  GlobalKey homeKey = GlobalKey();
  final DashboardApi dashboardApi = DashboardApi();
  // final ItemPositionsListener itemPositionsListener =
  //     ItemPositionsListener.create();
  // final ScrollOffsetListener scrollOffsetListener =
  //     ScrollOffsetListener.create();

  @override
  void initState() {
    super.initState();
    dashboardProvider = context.read();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      dashboardApi.getPortfolioViewCount().listen((event) {
        dashboardProvider.changeViewedCount(event);
      });
    });
    updateDeviceData();
  }

  updateDeviceData() async {
    bool? key = await SessionManager.getTheKey();
    if (key == null) {
      BrowserDataModel data = await SessionManager.getDeviceInfo();
      dashboardApi.saveDeviceInfo(data);
      dashboardApi.updateCount();
      SessionManager.setTheKey();
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: PreferredSize(
          preferredSize: Size(size.width,
              kToolbarHeight + (size.width < Utils.mobileMaxWidth ? 50 : 30)),
          child: const AppBarWidget()),
      body: Scrollbar(
        trackVisibility: true,
        thumbVisibility: true,
        thickness: 8,
        interactive: true,
        controller: dashboardProvider.yourScrollController,
        child: SingleChildScrollView(
          controller: dashboardProvider.yourScrollController,
          child: Column(
            children: [
              SizedBox(key: homeKey),
              Consumer<DashboardProvider>(builder: (context, value, chi) {
                return ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: value.menuItems.length,
                  itemBuilder: (context, index) {
                    HeaderModel headerModel = value.menuItems[index];
                    return SizedBox(
                      key: headerModel.key,
                      child: headerModel.child,
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
