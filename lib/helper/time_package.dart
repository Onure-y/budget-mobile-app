import 'package:intl/intl.dart';

class TimePackage {
  static int getCurrentTimestamp() {
    int currentTime = DateTime.now().millisecondsSinceEpoch;
    return currentTime;
  }

  static String getCurrentTime() {
    final format = DateFormat('yyyy-mm-dd hh:mm');
    int time = getCurrentTimestamp();
    String currentTime =
        format.format(DateTime.fromMillisecondsSinceEpoch(time));
    return currentTime;
  }
}
