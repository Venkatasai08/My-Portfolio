import 'package:flutter/material.dart';

class HeaderModel {
  final int index;
  final String name;
  final IconData iconData;
  final Widget child;
  final GlobalKey key;

  HeaderModel({
    required this.index,
    required this.name,
    required this.iconData,
    required this.child,
    required this.key,
  });
}

class MediaModel {
  final String image;
  final String link;

  MediaModel({required this.image, required this.link});
}

class ResponseModel {
  final bool isSuccess;
  final String message;

  ResponseModel({required this.isSuccess, required this.message});
}
