import 'package:africhange_screening/data/models/currency_rate.dart';

abstract class CurrencyRepositoryInterface {
  Future<List<CurrencyRate>> getLatestCurrencyRates();
}