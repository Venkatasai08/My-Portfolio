import 'package:portfolio/constants/supabaseConstants.dart';
import 'package:portfolio/models/browserDataModel.dart';
import 'package:portfolio/models/headerModel.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DashboardApi {
  final supabase = Supabase.instance.client;
  final SupabaseConsts sbconsts = SupabaseConsts();

  int countId = 1;
  Stream<List<BrowserDataModel>> getDevicesAllViewedCount() {
    return supabase
        .from(sbconsts.viewedDevices)
        .select()
        .asStream()
        .map((event) => event.map((e) => BrowserDataModel.fromMap(e)).toList());
  }

  Future<ResponseModel> saveDeviceInfo(BrowserDataModel data) async {
    try {
      await supabase.from(sbconsts.viewedDevices).insert(data.toMap());
      return ResponseModel(isSuccess: true, message: "Success");
    } catch (e) {
      return ResponseModel(isSuccess: false, message: e.toString());
    }
  }

  Stream<int> getPortfolioViewCount() {
    return supabase
        .from(sbconsts.portfolioViewCount)
        .stream(primaryKey: ["id"]).map((event) => event[0][sbconsts.count]);
  }

  Future<ResponseModel> updateCount() async {
    try {
      List<Map> data = await supabase
          .from(sbconsts.portfolioViewCount)
          .select()
          .match({"id": countId});
      int count = data[0][sbconsts.count];
      count = count + 1;
      await supabase.from(sbconsts.portfolioViewCount).update(
        {sbconsts.count: count},
      ).match(
        {"id": 1},
      );
      return ResponseModel(isSuccess: true, message: "Success");
    } catch (e) {
      return ResponseModel(isSuccess: false, message: e.toString());
    }
  }
}
