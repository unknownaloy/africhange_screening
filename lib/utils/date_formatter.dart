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

  /// This method uses the [_getStipulatedDate] and [_getFormattedYearMonthDay]
  /// methods to generate a List of [DateTime] as [String] from the passed in
  /// "range"
  static List<String> getDaysInBetween(int range) {

    final currentDate = _generateSystemTime();

    final endDate = _getStipulatedDate(currentDate, range);

    List<String> dateRange = [];

    for (int i = 0; i <= currentDate.difference(endDate).inDays; i++) {
      final formattedDate = _getFormattedYearMonthDay(endDate.add(Duration(days: i)));
      dateRange.add(formattedDate);
    }

    return dateRange;
  }

  /// This method receives a [DateTime] and uses the "range" value passed in to
  /// return a [DateTime] going back to the range value
  static DateTime _getStipulatedDate (DateTime currentDate, int range) {
    return currentDate.subtract( Duration(days: range));
  }

  /// This method formats [DateTime] passed in as an argument to a readable
  /// format. e.g. -> "2022-02-24"
  static String _getFormattedYearMonthDay(DateTime dateTime) {
    final year = _yearFormat.format(dateTime);
    final month = _monthFormat.format(dateTime).toString().padLeft(2, "0");
    final day = _dayFormat.format(dateTime).toString().padLeft(2, "0");

    final yearMonthDay = "$year-$month-$day";

    return yearMonthDay;
  }
}
