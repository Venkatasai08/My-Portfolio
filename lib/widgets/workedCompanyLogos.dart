import 'package:flutter/material.dart';
import 'package:portfolio/globals/app_assets.dart';

class WorkedCompanyLogos extends StatelessWidget {
  const WorkedCompanyLogos({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> logos = [
      AppAssets.swechaLogo,
      AppAssets.mikhLogo,
      AppAssets.cogentLogo,
    ];
    return Wrap(
      alignment: WrapAlignment.center,
      children: logos
          .map(
            (e) => SizedBox(
              height: 100,
              child: AspectRatio(
                aspectRatio: 3 / 2,
                child: Image.asset(e
                    // fit: BoxFit.cover,
                    ),
              ),
            ),
          )
          .toList(),
    );
  }
}
