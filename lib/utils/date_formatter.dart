import 'package:intl/intl.dart';

DateTime _generateSystemTime() {
  return DateTime.now();
}

class DateFormatter {
  static final _24HoursFormat = DateFormat('H:m');

  static String getTimeIn24HoursFormat() {
    final currentTime = _generateSystemTime();

    return _24HoursFormat.format(currentTime);
  }
}
