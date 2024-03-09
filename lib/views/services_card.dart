import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/globals/app_colors.dart';
import 'package:portfolio/globals/app_text_styles.dart';
import 'package:portfolio/globals/utils.dart';
import 'package:portfolio/models/serviceModel.dart';
import 'package:portfolio/provider/myServicesProvider.dart';
import 'package:provider/provider.dart';

class ServiceCardWidget extends StatefulWidget {
  const ServiceCardWidget({super.key});

  @override
  State<ServiceCardWidget> createState() => _ServiceCardWidgetState();
}

class _ServiceCardWidgetState extends State<ServiceCardWidget> {
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
