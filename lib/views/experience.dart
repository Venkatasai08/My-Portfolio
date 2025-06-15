import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/globals/utils.dart';
import 'package:portfolio/models/experienceModel.dart';
import 'package:portfolio/provider/skillsProvider.dart';
import 'package:provider/provider.dart';

class ExperienceWidget extends StatelessWidget {
  const ExperienceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SlideInRight(
      from: 500,
      duration: const Duration(seconds: 2),
      child: Consumer<SkillProvider>(
        builder: (context, value, ch) {
          return ListView.builder(
            primary: false,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: value.experienceList.length,
            itemBuilder: (BuildContext context, int index) {
              ExperienceModel model = value.experienceList[index];
              String year = DateTime.fromMillisecondsSinceEpoch(
                      model.workingYears.joiningDate)
                  .year
                  .toString();
              DateTime joiningDate = DateTime.fromMillisecondsSinceEpoch(
                  model.workingYears.joiningDate);
              String joiningDateString =
                  "${joiningDate.day} ${Utils.monthsShortList[joiningDate.month - 1]}, ${joiningDate.year}";
              String endingDateString = "Current";
              if (!model.workingYears.isCurrent) {
                DateTime endingDate = DateTime.fromMillisecondsSinceEpoch(
                    model.workingYears.endingDate!);
                endingDateString =
                    "${endingDate.day} ${Utils.monthsShortList[endingDate.month - 1]}, ${endingDate.year}";
              }

              return Padding(
                padding: const EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: () {
                    value.changeSelectedExperience(index);
                  },
                  child: Card(
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: FittedBox(
                                  child: Text(
                                    year,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                flex: 5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      model.designation,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      model.companyName,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      "$joiningDateString - $endingDateString",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          value.selectedExperience == index
                              ? Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15, left: 10, right: 10),
                                  child: Text(
                                    model.description,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                )
                              : const SizedBox()
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
