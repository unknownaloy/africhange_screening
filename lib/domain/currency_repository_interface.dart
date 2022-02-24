import 'package:africhange_screening/data/models/convert_rate.dart';
import 'package:africhange_screening/data/models/currency_rate.dart';

abstract class CurrencyRepositoryInterface {
  Future<List<CurrencyRate>> getLatestCurrencyRates();

  Future<ConvertRate> getCurrencyConvertRate({
    required String fromCurrency,
    required String toCurrency,
    required num amount,
  });
}
