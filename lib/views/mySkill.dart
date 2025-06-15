import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/models/skillsModel.dart';
import 'package:portfolio/provider/skillsProvider.dart';
import 'package:portfolio/widgets/expandedCard.dart';
import 'package:provider/provider.dart';

class SkillsGridViewOld extends StatelessWidget {
  final double paddingInImage;
  const SkillsGridViewOld({super.key, this.paddingInImage = 25});

  @override
  Widget build(BuildContext context) {
    const double borderRadius = 150;
    final Size size = MediaQuery.of(context).size;
    return Consumer<SkillProvider>(
      builder: (context, value, ch) {
        return Align(
          alignment: Alignment.topCenter,
          child: Wrap(
            runSpacing: 0,
            spacing: 15,
            alignment: WrapAlignment.start,
            runAlignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: value.mySkills
                .map(
                  (model) => InkWell(
                    onTap: () {
                      if (size.width < 1200) {
                        if (value.hoverIndex != model.sortOrder) {
                          value.changeHoverINdex(model.sortOrder);
                        } else {
                          value.changeHoverINdex(null);
                        }
                      }
                    },
                    onHover: (val) {
                      if (val) {
                        value.changeHoverINdex(model.sortOrder);
                      } else {
                        value.changeHoverINdex(null);
                      }
                    },
                    child: AnimatedContainer(
                      height: 150,
                      width: size.width < 400 ? 100 : 110,
                      duration: const Duration(milliseconds: 300),
                      padding:
                          const EdgeInsets.only(top: 10, left: 10, right: 10),
                      decoration: BoxDecoration(
                        color: value.hoverIndex == model.sortOrder
                            ? const Color.fromRGBO(237, 242, 248, 1)
                            : Colors.transparent,
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(borderRadius),
                          topRight: const Radius.circular(borderRadius),
                          bottomLeft: Radius.circular(
                            value.hoverIndex == model.sortOrder
                                ? 20
                                : borderRadius,
                          ),
                          bottomRight: Radius.circular(
                            value.hoverIndex == model.sortOrder
                                ? 20
                                : borderRadius,
                          ),
                        ),
                        // boxShadow: value.hoverIndex == index
                        //     ? [
                        //         BoxShadow(
                        //             color: Colors.white.withOpacity(0.3),
                        //             spreadRadius: 5,
                        //             blurRadius: 15),
                        //       ]
                        //     : [],
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 600),
                              padding: EdgeInsets.all(paddingInImage),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: value.hoverIndex == model.sortOrder
                                      ? [
                                          BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.2),
                                              blurRadius: 3,
                                              spreadRadius: 5)
                                        ]
                                      : []),
                              child: Image.network(
                                model.skillImage,

                                // height: ,
                              ),
                            ),
                          ),
                          Visibility(
                            visible: value.hoverIndex == model.sortOrder,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  model.skill,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                SizedBox(
                                  height: 35,
                                  child: Text(
                                      skillEnumToTextConverter(
                                          model.skillLevel),
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }
}

class SkillsGridView extends StatelessWidget {
  final double paddingInImage;

  const SkillsGridView({super.key, this.paddingInImage = 25});

  Widget backWidget(SkillModel model) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Spacer(),
        Text(
          model.skill,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 35,
          child: Text(skillEnumToTextConverter(model.skillLevel),
              overflow: TextOverflow.ellipsis),
        ),
      ],
    );
  }

  Widget frontWidget(SkillModel model) {
    return Container(
      height: 100,
      width: 100,
      padding: EdgeInsets.all(paddingInImage),
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 3,
                spreadRadius: 5)
          ]),
      child: Image.network(
        model.skillImage,

        // height: ,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const double borderRadius = 150;
    final Size size = MediaQuery.of(context).size;
    return SlideInLeft(
      from: 500,
      duration: const Duration(seconds: 2),
      child: Consumer<SkillProvider>(builder: (context, value, ch) {
        return Align(
          alignment: Alignment.topCenter,
          child: Wrap(
            runSpacing: 10,
            spacing: 15,
            alignment: WrapAlignment.start,
            runAlignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: value.mySkills.map((model) {
              return SizedBox(
                height: 160,
                width: 130,
                child: ExpandedCard(
                    height: 95,
                    width: 100,
                    frontWidget: InkWell(
                        splashColor: Colors.transparent,
                        onTap: () {
                          debugPrint("called");
                          if (value.hoverIndex != model.sortOrder) {
                            value.changeHoverINdex(model.sortOrder);
                          } else {
                            value.changeHoverINdex(null);
                          }
                        },
                        child: frontWidget(model)),
                    backWidget: backWidget(model),
                    isExpanded: value.hoverIndex == model.sortOrder),
              );
            }).toList(),
          ),
        );
      }),
    );
  }
}
