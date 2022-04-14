import 'package:intl/intl.dart';

class TimePackage {
  static int getCurrentTimestamp() {
    int currentTime = DateTime.now().millisecondsSinceEpoch;
    return currentTime;
  }

  static String getMovementTime(int timestamp) {
    final format = DateFormat('yyyy-MM-dd hh:mm');
    String time = format.format(DateTime.fromMillisecondsSinceEpoch(timestamp));
    return time;
  }

  static String getCurrentTime() {
    final format = DateFormat('yyyy-MM-dd hh:mm');
    int time = getCurrentTimestamp();
    String currentTime =
        format.format(DateTime.fromMillisecondsSinceEpoch(time));
    return currentTime;
  }
}
