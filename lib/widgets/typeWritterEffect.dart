import 'dart:async';

import 'package:flutter/material.dart';

class TypeWritterEffect extends StatefulWidget {
  final List<String> dataList;
  final TextStyle style;
  const TypeWritterEffect({
    super.key,
    required this.dataList,
    required this.style,
  });

  @override
  State<TypeWritterEffect> createState() => _TypeWritterEffectState();
}

class _TypeWritterEffectState extends State<TypeWritterEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  List<String> dataList = [];
  Timer? timer;
  @override
  void initState() {
    super.initState();
    dataList = [...widget.dataList, ""];
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      text = dataList[0];
      textEffect = text;
      index = 0;
      setState(() {});
      await Future.delayed(const Duration(milliseconds: 500));
      typeEffectStart();
    });
  }

  int index = 0;
  int stringIndex = 0;
  String text = "";
  String textEffect = "";
  typeEffectStart() {
    timer?.cancel();
    timer = Timer.periodic(const Duration(milliseconds: 100), (timer) async {
      if (index == dataList.length - 1) {
        index = -1;
      }
      if (stringIndex == text.length) {
        stringIndex = 0;
        index = index + 1;
        text = dataList[index];
        return;
      }
      text = dataList[index];
      stringIndex = stringIndex + 1;
      textEffect = text.substring(0, stringIndex);
      setState(() {});
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, cg) {
        return Text(
          textEffect,
          style: widget.style,
        );
      },
    );
  }
}
