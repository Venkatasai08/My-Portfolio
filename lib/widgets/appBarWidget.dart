import 'package:flutter/material.dart';
import 'package:portfolio/constants/appKeys.dart';
import 'package:portfolio/globals/app_colors.dart';

import 'package:portfolio/globals/utils.dart';
import 'package:portfolio/models/headerModel.dart';
import 'package:portfolio/provider/dashboardProvider.dart';
import 'package:portfolio/widgets/medialIconsListView.dart';

import 'package:portfolio/widgets/portfolioviewCount.dart';
import 'package:provider/provider.dart';

class SideBarWidget extends StatelessWidget {
  const SideBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Consumer<DashboardProvider>(builder: (context, value, ch) {
      return Material(
        color: value.selectedIndex % 2 == 0
            ? AppColors.bgColor
            : AppColors.bgColor2,
        elevation: 20,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PortfolioViewCountWidget(),
            HeaderIconsListView(),
            IconsListViewWidget(
              axis: Axis.vertical,
            ),
          ],
        ),
      );
    });
  }
}

class HeaderIconsListView extends StatelessWidget {
  const HeaderIconsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final DashboardProvider dashboardProvider = context.read();
    final size = MediaQuery.of(context).size;

    return ListView.separated(
      primary: true,
      itemCount: dashboardProvider.menuItems.length,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      separatorBuilder: (context, child) => const SizedBox(
        height: 10,
      ),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            // if (size.width < Utils.mobileMaxWidth) {
            //   scaffoldKeyForDashboard.currentState?.closeEndDrawer();
            // }
            // dashboardProvider.scrollTo(
            //     index: dashboardProvider.menuItems[index].index);
            dashboardProvider.changeSelectedIndex(index);
          },
          borderRadius: BorderRadius.circular(100),
          onHover: (value) {
            if (!(size.width < Utils.mobileMaxWidth)) {
              dashboardProvider.changeMenuItemOnHover(value, index);
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Consumer<DashboardProvider>(
              builder: (context, value, child) {
                bool selectedIndex = value.selectedIndex == index;
                HeaderModel data = dashboardProvider.menuItems[index];
                return AnimatedContainer(
                  alignment: Alignment.center,
                  duration: const Duration(milliseconds: 200),
                  child: iconsMethod(data, selectedIndex),
                );
              },
            ),
          ),
        );
      },
    );
  }

  Padding iconsMethod(HeaderModel data, bool hover) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Icon(
        data.iconData,
        size: 30,
        color: hover ? AppColors.themeColor : AppColors.white,
      ),
    );
  }
}
