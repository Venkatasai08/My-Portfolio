import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/globals/app_colors.dart';
import 'package:portfolio/globals/app_text_styles.dart';
import 'package:portfolio/globals/utils.dart';
import 'package:portfolio/models/serviceModel.dart';
import 'package:portfolio/provider/myServicesProvider.dart';
import 'package:portfolio/widgets/customCarousel.dart';
import 'package:provider/provider.dart';

class ServiceCardWidgetForMobile extends StatefulWidget {
  const ServiceCardWidgetForMobile({super.key});

  @override
  State<ServiceCardWidgetForMobile> createState() =>
      _ServiceCardWidgetForMobileState();
}

class _ServiceCardWidgetForMobileState
    extends State<ServiceCardWidgetForMobile> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 650, minWidth: 320),
      child: Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 5,
              blurRadius: 5,
              offset: const Offset(3, 3),
            )
          ],
        ),
        child: Consumer<ServicesProvider>(
          builder: (context, value, ch) {
            ServiceModel data = value.services[value.selectedService];
            if (size.width < Utils.mobileMaxWidth) {
              return Column(
                children: [
                  ImageMethod(data.image, 250),
                  const SizedBox(
                    height: 15,
                  ),
                  textMethod(data)
                ],
              );
            } else {
              return Row(
                children: [
                  ImageMethod(data.image, 200),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(child: textMethod(data))
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Column textMethod(ServiceModel data) {
    return Column(
      children: [
        Text(
          data.title,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          data.text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }

  ClipRRect ImageMethod(String image, double size) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        image,
        fit: BoxFit.cover,
        height: size,
        width: size,
      ),
    );
  }
}

class ServiceCardWidget extends StatelessWidget {
  const ServiceCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool isMobile = size.width < Utils.mobileMaxWidth;
    ServicesProvider servicesProvider = context.read();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      servicesProvider.servicesListController
          .animateToPage(1, duration: Durations.medium1, curve: Curves.linear);
    });

    return Consumer<ServicesProvider>(builder: (context, value, ch) {
      double height = isMobile ? size.height * 0.75 : 400;
      double width = isMobile ? size.width * 0.9 : 650;

      return SizedBox(
        height: height,
        child: CustomCarousel(
          onPageChanged: (index) {
            servicesProvider.changeSelectedService(index);
          },
          controller: value.servicesListController,
          itemCount: value.services.length,
          itemBuilder: (BuildContext context, int index) {
            ServiceModel data = value.services[index];

            return GestureDetector(
              onTap: () {
                servicesProvider.changeSelectedService(index);
                servicesProvider.servicesListController.animateToPage(index,
                    duration: Durations.medium1, curve: Curves.linear);
              },
              child: Container(
                height: height,
                width: width,
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: const Offset(3, 3),
                    )
                  ],
                ),
                child: Builder(
                  builder: (context) {
                    return Row(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: IntrinsicHeight(
                              child: Image.network(
                                data.image,
                                height: 380,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Expanded(
                          flex: 2,
                          child: textMethod(data),
                        )
                      ],
                    );
                  },
                ),
              ),
            );
          },
        ),
      );
    });
  }

  Column textMethod(ServiceModel data) {
    return Column(
      children: [
        Text(
          data.title,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          data.text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
