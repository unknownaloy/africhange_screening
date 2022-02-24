import 'package:intl/intl.dart';

DateTime _generateSystemTime() {
  return DateTime.now();
}

class DateFormatter {
  static final _24HoursFormat = DateFormat('H:m');

  static final _yearFormat = DateFormat("y");
  static final _monthFormat = DateFormat("M");
  static final _dayFormat = DateFormat("d");

  static String getTimeIn24HoursFormat() {
    final currentTime = _generateSystemTime();

    return _24HoursFormat.format(currentTime);
  }

  static String _getFormattedYearMonthDAy(DateTime dateTime) {
    final year = _yearFormat.format(dateTime);
    final month = _monthFormat.format(dateTime).toString().padLeft(2, "0");
    final day = _dayFormat.format(dateTime).toString().padLeft(2, "0");

    final yearMonthDay = "$year-$month-$day";

    return yearMonthDay;
  }

  static DateTime getStipulatedDate (DateTime currentDate, int range) {
    return currentDate.subtract( Duration(days: range));
  }

  static List<String> getDaysInBetween(int range) {

    final currentDate = _generateSystemTime();

    final endDate = getStipulatedDate(currentDate, range);

    List<String> dateRange = [];

    for (int i = 0; i <= currentDate.difference(endDate).inDays; i++) {
      final formattedDate = _getFormattedYearMonthDAy(endDate.add(Duration(days: i)));
      dateRange.add(formattedDate);
    }

    return dateRange;
  }
}
