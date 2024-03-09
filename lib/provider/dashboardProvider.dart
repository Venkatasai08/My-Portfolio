import 'package:flutter/material.dart';
import 'package:portfolio/models/headerModel.dart';
import 'package:portfolio/responsiveViews/aboutMeScreen.dart';
import 'package:portfolio/responsiveViews/contactUsScreen.dart';
import 'package:portfolio/responsiveViews/homePageScreen.dart';
import 'package:portfolio/responsiveViews/myProjectsScreen.dart';
import 'package:portfolio/responsiveViews/myServicesScreen.dart';
import 'package:portfolio/responsiveViews/mySkills&ExpScreen.dart';
import 'package:portfolio/views/contact_us_textfeild.dart';
import 'package:portfolio/views/my_services.dart';

class DashboardProvider extends ChangeNotifier {
  int? menuIndex = 0;
  List<HeaderModel> menuItems = <HeaderModel>[
    HeaderModel(
        index: 0,
        name: 'Home',
        iconData: Icons.home,
        key: GlobalKey(),
        child: const HomePageScreen()),
    HeaderModel(
      index: 1,
      name: 'About',
      iconData: Icons.data_exploration,
      key: GlobalKey(),
      child: const AboutMeScreen(),
    ),
    HeaderModel(
      index: 2,
      name: 'Services',
      iconData: Icons.nature,
      key: GlobalKey(),
      child: const MyServicesScreen(),
    ),
    HeaderModel(
      index: 3,
      name: 'Projects',
      iconData: Icons.propane_outlined,
      key: GlobalKey(),
      child: const MyProjectsScreen(),
    ),
    HeaderModel(
      index: 4,
      name: 'Skills',
      iconData: Icons.more,
      key: GlobalKey(),
      child: const SkillsAndExperience(),
    ),
    HeaderModel(
      index: 5,
      name: 'Contact',
      iconData: Icons.contact_emergency,
      key: GlobalKey(),
      child: const ContactUsScreen(),
    ),
  ];

  Future scrollTo({required int index}) async {
    // int i = menuItems.indexWhere((element) => element.index == index);

    // if (i != -1) {
    menuIndex = index;

    notifyListeners();
    HeaderModel item = menuItems[index];
    // Scrollable.;
    Scrollable.ensureVisible(item.key.currentContext!,
        duration: const Duration(seconds: 1), curve: Curves.ease);
  }

  final yourScrollController = ScrollController();
  changeMenuItemOnHover(bool value, int index) {
    if (value) {
      menuIndex = index;
    } else {
      menuIndex = null;
    }
    notifyListeners();
  }

  // void _onScroll() {
  //   // Calculate the visibility of the widget based on its position in the viewport
  //   final position = yourScrollController.position;
  //   final viewportDimension = position.viewportDimension;
  //   final contentDimension =
  //       position.maxScrollExtent - position.minScrollExtent;
  //   final scrolledOffset = position.extentBefore;

  //   final visibilityFraction =
  //       (viewportDimension - (scrolledOffset % contentDimension)) /
  //           viewportDimension;

  //   // Update visibility state based on the calculated fraction
  //   setState(() {
  //     isVisible =
  //         visibilityFraction > 0.5; // Adjust visibility threshold as needed
  //   });
  // }

  int viewedCount = 0;
  changeViewedCount(int count) {
    viewedCount = count;
    notifyListeners();
  }
}
