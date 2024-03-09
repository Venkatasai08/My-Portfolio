import 'package:device_info_plus/device_info_plus.dart';
import 'package:portfolio/models/browserDataModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  static String presentOrNotKey = "PresentOrNotKey";
  static Future<bool> setTheKey() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool(presentOrNotKey, true);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool?> getTheKey() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      bool? key = prefs.getBool(presentOrNotKey);
      return key;
    } catch (e) {
      return false;
    }
  }

  static Future<BrowserDataModel> getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    // AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    // print('Running on ${androidInfo.model}'); // e.g. "Moto G (4)"

    // IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    // print('Running on ${iosInfo.utsname.machine}'); // e.g. "iPod7,1"

    WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
    // print('Running on ${webBrowserInfo.toMap()}');
    BrowserDataModel browserDataModel = BrowserDataModel(
        browserName: webBrowserInfo.browserName.toString(),
        appCodeName: webBrowserInfo.appCodeName ?? "",
        platForm: webBrowserInfo.platform ?? "",
        userAgent: webBrowserInfo.userAgent ?? "",
        vendor: webBrowserInfo.vendor ?? "");
    return browserDataModel;
  }
}
