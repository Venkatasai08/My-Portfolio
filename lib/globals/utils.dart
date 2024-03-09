import 'package:device_info_plus/device_info_plus.dart';
import 'package:portfolio/models/browserDataModel.dart';

class Utils {
  static String convertToKandM({required num count, int decimalPoints = 1}) {
    var convertedStringNumber = "";
    String stringExtension = count.toString();

    int number = 0;

    if (stringExtension != "") {
      if (stringExtension.contains(".")) {
        number = int.parse(stringExtension.split(".").first);
      } else {
        number = int.parse(stringExtension);
      }
      if (number < 1000) {
        convertedStringNumber = "$number";
      } else if (number >= 1000 && number < 1000000) {
        String floorNumber = (number / 1000).toStringAsFixed(decimalPoints);
        convertedStringNumber = "${floorNumber}k";
      } else if (number >= 1000000 && number < 1000000000) {
        String floorNumber = (number / 1000000).toStringAsFixed(decimalPoints);
        convertedStringNumber = "${floorNumber}m";
      } else {
        String floorNumber =
            (number / 1000000000).toStringAsFixed(decimalPoints);
        convertedStringNumber = "${floorNumber}b";
      }
    }

    return convertedStringNumber;
  }

  static int mobileMaxWidth = 768;
  static const String SUPA_BASE_API_KEY = "";
  static const String SUPA_BASE_API_URL = "";
}
