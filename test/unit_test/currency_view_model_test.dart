import 'package:africhange_screening/data/models/currency_rate.dart';
import 'package:africhange_screening/data/repository/currency_repository.dart';
import 'package:africhange_screening/enums/request_state.dart';
import 'package:africhange_screening/features/home/view_model/currency_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'currency_view_model_test.mocks.dart';

@GenerateMocks([CurrencyRepository])
void main() {
  late CurrencyViewModel sut;
  late MockCurrencyRepository currencyRepository;

  setUp(() {
    currencyRepository = MockCurrencyRepository();
    sut = CurrencyViewModel(currencyRepository: currencyRepository);
  });

  group("Test for CurrencyViewModel class", () {
    const defaultFromCurrency = CurrencyRate(symbol: "EUR", rate: 1);

    test("Test that initial values are current", () {
      expect(sut.currencyRates, []);
      expect(sut.requestState, const RequestState.idle());
      expect(sut.historicPriceData, []);
      expect(sut.historicPriceRequestState, const RequestState.idle());
      expect(sut.fromCurrencyRate, defaultFromCurrency);
    });
  });
}
