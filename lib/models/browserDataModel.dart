// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BrowserDataModel {
  final int? id;
  final String browserName;
  final String appCodeName;
  final String platForm;
  final String userAgent;
  final String vendor;

  BrowserDataModel(
      {this.id,
      required this.browserName,
      required this.appCodeName,
      required this.platForm,
      required this.userAgent,
      required this.vendor});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      // 'id': id,
      'browserName': browserName,
      'appCodeName': appCodeName,
      'platForm': platForm,
      'userAgent': userAgent,
      'vendor': vendor,
    };
  }

  factory BrowserDataModel.fromMap(Map<String, dynamic> map) {
    return BrowserDataModel(
      id: map['id'] as int,
      browserName: map['browserName'] as String,
      appCodeName: map['appCodeName'] as String,
      platForm: map['platForm'] as String,
      userAgent: map['userAgent'] as String,
      vendor: map['vendor'] as String,
    );
  }
}
