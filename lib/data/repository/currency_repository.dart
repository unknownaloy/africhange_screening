import 'package:africhange_screening/data/models/currency_rate.dart';
import 'package:africhange_screening/domain/currency_repository_interface.dart';

class CurrencyRepository implements CurrencyRepositoryInterface {


  @override
  Future<List<CurrencyRate>> getLatestCurrencyRates() async {
    // TODO: implement getLatestCurrencyRates
    throw UnimplementedError();
  }

}