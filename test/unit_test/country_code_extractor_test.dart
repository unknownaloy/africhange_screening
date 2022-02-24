import 'package:africhange_screening/utils/country_code_extractor.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group("Test the return value of CountryCodeUrlExtractor extract method", () {
    test("Testing that a valid url is returned", () {
      final result = CountryCodeUrlExtractor.extract("EUR");

      expect(result, "https://countryflagsapi.com/png/eu");
    });

    test("Testing that 'null' is returned when a single String value is passed", () {
      final result = CountryCodeUrlExtractor.extract("E");

      expect(result, null);
    });
  });
}
