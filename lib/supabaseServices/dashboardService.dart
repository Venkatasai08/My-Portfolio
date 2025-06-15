import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/models/browserDataModel.dart';
import 'package:portfolio/models/headerModel.dart';
import 'package:portfolio/models/serviceModel.dart';
import 'package:portfolio/models/userDetails.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;
DocumentReference get docRef =>
    firestore.collection(Constants().portfolio).doc(Constants().portfolio);

class DashboardApi {
  final Constants consts = Constants();

  int countId = 1;
  Stream<List<BrowserDataModel>> getDevicesAllViewedCount() {
    // return supabase
    //     .from(consts.viewedDevices)
    //     .select()
    //     .asStream()
    //     .map((event) => event.map((e) => BrowserDataModel.fromMap(e)).toList());

    return docRef.collection(consts.viewedDevices).snapshots().map((event) =>
        event.docs.map((e) => BrowserDataModel.fromMap(e.data())).toList());
  }

  Future<ResponseModel> saveDeviceInfo(BrowserDataModel data) async {
    try {
      await docRef.collection(consts.viewedDevices).add(data.toMap());
      return ResponseModel(isSuccess: true, message: "Success");
    } catch (e) {
      return ResponseModel(isSuccess: false, message: e.toString());
    }
  }

  Stream<UserDetailsModel> getPortfolioViewCount() {
    return docRef.snapshots().map((event) {
      debugPrint(event.data().toString());
      return UserDetailsModel.fromMap(event.data() as Map<String, dynamic>);
    });
  }

  Future<ResponseModel> updateCount() async {
    try {
      DocumentSnapshot data = await docRef.get();
      int count = data[consts.count];
      count = count + 1;
      await docRef.update(
        {consts.count: count},
      );
      return ResponseModel(isSuccess: true, message: "Success");
    } catch (e) {
      return ResponseModel(isSuccess: false, message: e.toString());
    }
  }
}
