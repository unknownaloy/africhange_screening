import 'package:africhange_screening/utils/date_formatter.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group("Test the return value of CountryCodeUrlExtractor extract method", () {

    final dummyDateTime = DateTime(2022, 02, 24, 18, 10, 50, 100, 500);
    test("Testing that a valid url is returned", () {
      final result = DateFormatter(() => dummyDateTime).getTimeIn24HoursFormat();

      print("result from test -> $result");

      expect(result, "18:10");
    });
  });
}
