import 'package:flutter/material.dart';
import 'package:portfolio/globals/app_colors.dart';
import 'package:portfolio/globals/app_text_styles.dart';
import 'package:portfolio/globals/constants.dart';
import 'package:portfolio/models/headerModel.dart';
import 'package:portfolio/provider/dashboardProvider.dart';
import 'package:portfolio/widgets/portfolioviewCount.dart';
import 'package:provider/provider.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return AppBar(
      backgroundColor: AppColors.bgColor,
      toolbarHeight: 90,
      // titleSpacing: 40,
      elevation: 0,
      bottom: size.width >= 700
          ? null
          : PreferredSize(
              preferredSize: Size(size.width, 156),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PortfolioViewCountWidget(),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: HeaderIconsListView(
                      isMobile: true,
                    ),
                  ),
                ],
              ),
            ),
      title: size.width >= 700 ? const PortfolioViewCountWidget() : null,
      actions: [
        size.width >= 700
            ? const HeaderIconsListView(
                isMobile: false,
              )
            : const SizedBox(),
        const SizedBox(
          width: 20,
        )
      ],
    );
  }
}

class HeaderIconsListView extends StatelessWidget {
  final bool isMobile;
  const HeaderIconsListView({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final DashboardProvider dashboardProvider = context.read();
    final onMenuHover = Matrix4.identity()..scale(1.05);
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      primary: true,
      child: SizedBox(
        height: 30,
        child: ListView.separated(
          primary: false,
          itemCount: dashboardProvider.menuItems.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, child) => Constants.sizedBox(width: 8),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                dashboardProvider.scrollTo(
                    index: dashboardProvider.menuItems[index].index);
              },
              borderRadius: BorderRadius.circular(100),
              onHover: (value) {
                dashboardProvider.changeMenuItemOnHover(value, index);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Consumer<DashboardProvider>(
                  builder: (context, value, child) {
                    bool hover = value.menuIndex == index;
                    HeaderModel data = dashboardProvider.menuItems[index];
                    return AnimatedContainer(
                      alignment: Alignment.center,
                      duration: const Duration(milliseconds: 200),
                      transform: hover ? onMenuHover : null,
                      child: Row(
                        children: [
                          isMobile
                              ? iconsMethod(data, hover)
                              : hover
                                  ? iconsMethod(data, hover)
                                  : const SizedBox(),
                          isMobile
                              ? const SizedBox()
                              : Text(
                                  data.name,
                                  style: AppTextStyles.headerTextStyle(
                                      color: hover
                                          ? AppColors.themeColor
                                          : AppColors.white),
                                ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Padding iconsMethod(HeaderModel data, bool hover) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: Icon(
        data.iconData,
        size: 20,
        color: hover ? AppColors.themeColor : AppColors.white,
      ),
    );
  }
}
