class CountryCodeUrlExtractor {
  static String? extract(String currencyCode) {
    if (currencyCode.length < 2) {
      return null;
    }

    final countryCode = currencyCode.substring(0, 2).toLowerCase();

    final flagUrl = "https://countryflagsapi.com/png/$countryCode";

    return flagUrl;
  }
}