class CountryCodeUrlExtractor {

  /// This method accepts a "currencyCode" as an argument and uses it to append
  /// to and return a url for getting the currency's country flag image
  static String? extract(String currencyCode) {
    if (currencyCode.length < 2) {
      return null;
    }

    final countryCode = currencyCode.substring(0, 2).toLowerCase();

    final flagUrl = "https://countryflagsapi.com/png/$countryCode";

    return flagUrl;
  }
}