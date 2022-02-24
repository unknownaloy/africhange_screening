class CountryCodeExtractor {
  static String? extract(String currencyCode) {
    if (currencyCode.length < 2) {
      return null;
    }

    return currencyCode.substring(0, 2).toLowerCase();
  }
}