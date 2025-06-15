import 'package:flutter/material.dart';
import 'package:portfolio/globals/app_assets.dart';
import 'package:portfolio/models/serviceModel.dart';
import 'package:portfolio/supabaseServices/contactUsService.dart';

class ServicesProvider extends ChangeNotifier {
  List<ServiceModel> services = [];
  final PageController servicesListController = PageController(
    viewportFraction: 0.5,
  );

  getServices() async {
    services = await ContactUsService().getServices();
    notifyListeners();
  }

  changeSelectedService(int index) {
    selectedService = index;
    notifyListeners();
  }

  int selectedService = 0;
  leftClicked() {
    if (selectedService == 0) {
      selectedService = services.length - 1;
    } else {
      selectedService = selectedService - 1;
    }

    notifyListeners();
  }

  rightClicked() {
    if (selectedService == services.length - 1) {
      selectedService = 0;
    } else {
      selectedService = selectedService + 1;
    }

    notifyListeners();
  }
}
