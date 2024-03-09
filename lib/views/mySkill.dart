import 'package:flutter/material.dart';
import 'package:portfolio/models/skillsModel.dart';
import 'package:portfolio/provider/skillsProvider.dart';
import 'package:provider/provider.dart';

class SkillsGridView extends StatelessWidget {
  final double paddingInImage;
  const SkillsGridView({super.key, this.paddingInImage = 25});

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
                        if (value.hoverIndex != model.id) {
                          value.changeHoverINdex(model.id);
                        } else {
                          value.changeHoverINdex(null);
                        }
                      }
                    },
                    onHover: (val) {
                      if (val) {
                        value.changeHoverINdex(model.id);
                      } else {
                        value.changeHoverINdex(null);
                      }
                    },
                    child: AnimatedContainer(
                      height: 150,
                      width: size.width < 400 ? 100 : 110,
                      duration: const Duration(milliseconds: 600),
                      padding:
                          const EdgeInsets.only(top: 10, left: 10, right: 10),
                      decoration: BoxDecoration(
                        color: value.hoverIndex == model.id
                            ? const Color.fromRGBO(237, 242, 248, 1)
                            : Colors.transparent,
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(borderRadius),
                          topRight: const Radius.circular(borderRadius),
                          bottomLeft: Radius.circular(
                            value.hoverIndex == model.id ? 20 : borderRadius,
                          ),
                          bottomRight: Radius.circular(
                            value.hoverIndex == model.id ? 20 : borderRadius,
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
                                  boxShadow: value.hoverIndex == model.id
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
                            visible: value.hoverIndex == model.id,
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
