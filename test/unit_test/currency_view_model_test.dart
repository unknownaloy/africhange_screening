import 'package:africhange_screening/data/models/currency_rate.dart';
import 'package:africhange_screening/data/repository/currency_repository.dart';
import 'package:africhange_screening/enums/request_state.dart';
import 'package:africhange_screening/features/home/view_model/currency_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'currency_view_model_test.mocks.dart';

@GenerateMocks([CurrencyRepository])
void main() {
  late CurrencyViewModel sut;
  late MockCurrencyRepository mockCurrencyRepository;

  setUp(() {
    mockCurrencyRepository = MockCurrencyRepository();
    sut = CurrencyViewModel(currencyRepository: mockCurrencyRepository);
  });

  final currencyRatesFromService = [
    const CurrencyRate(symbol: "NGN", rate: 1),
    const CurrencyRate(symbol: "EUR", rate: 1),
    const CurrencyRate(symbol: "USD", rate: 1),
  ];

  void initialCurrencyViewModelWithData () {
    when(mockCurrencyRepository.getLatestCurrencyRates()).thenAnswer(
          (_) async => currencyRatesFromService,
    );
  }

  test("Test that initial values are current", () {
    const defaultFromCurrency = CurrencyRate(symbol: "EUR", rate: 1);

    expect(sut.currencyRates, []);
    expect(sut.requestState, const RequestState.idle());
    expect(sut.historicPriceData, []);
    expect(sut.historicPriceRequestState, const RequestState.idle());
    expect(sut.fromCurrencyRate, defaultFromCurrency);
  });

  group("fetchLatestCurrencyRates", () {

    test("fetchLatestCurrencyRates uses the mockCurrencyRepository", () async {
      initialCurrencyViewModelWithData();

      await sut.fetchLatestCurrencyRates();
      verify(mockCurrencyRepository.getLatestCurrencyRates()).called(1);
    });

    test("""indicates loading of data, 
    set currencyRates to the one gotten from the service,
    indicates that the data is not being loaded anymore""", () async {
      initialCurrencyViewModelWithData();
      final future = sut.fetchLatestCurrencyRates();
      expect(sut.requestState, const RequestState.loading());
      await future;
      expect(
        sut.currencyRates,
        currencyRatesFromService,
      );
      expect(sut.toCurrencyRate, const CurrencyRate(symbol: "NGN", rate: 1),);
      expect(sut.requestState, const RequestState.success());
    });

  });

  group("getHistoricPriceRange", () {
    final List<num> historyPricesFromService = [
      1, 2, 3, 4, 5,
    ];

    void getHistoryPriceRangeReturn3HistoricPrices() {
      when(mockCurrencyRepository.getPriceHistoricRange(any)).thenAnswer(
            (_) async => historyPricesFromService,
      );
    }

    test("getHistoricPriceRange uses the mockCurrencyRepository", () async {
      getHistoryPriceRangeReturn3HistoricPrices();

      await sut.getHistoricPriceRange();
      verify(mockCurrencyRepository.getPriceHistoricRange(any)).called(1);
    });

    test("""indicates loading of data, 
    set historicPriceData to the ones gotten from the service,
    indicates that the data is not being loaded anymore""", () async {
      getHistoryPriceRangeReturn3HistoricPrices();
      final future = sut.getHistoricPriceRange();
      expect(sut.historicPriceRequestState, const RequestState.loading());
      await future;
      expect(
        sut.historicPriceData,
        historyPricesFromService,
      );
      expect(sut.historicPriceRequestState, const RequestState.success());
    });
  });

  test("swapFromAndToCurrencies", () async {
    initialCurrencyViewModelWithData();

    await sut.fetchLatestCurrencyRates();

    final previousFromCurrency = sut.fromCurrencyRate;
    final previousToCurrency = sut.toCurrencyRate;

    sut.swapFromAndToCurrencies();

    expect(sut.fromCurrencyRate, previousToCurrency);
    expect(sut.toCurrencyRate, previousFromCurrency);
  });


  test("updateFromCurrencyOption", () async {
      initialCurrencyViewModelWithData();

      await sut.fetchLatestCurrencyRates();

      sut.updateFromCurrencyOption("NGN");

      expect(sut.fromCurrencyRate.symbol, "NGN");
    });

  test("updateToCurrencyOption", () async {
      initialCurrencyViewModelWithData();

      await sut.fetchLatestCurrencyRates();

      sut.updateToCurrencyOption("NGN");

      expect(sut.toCurrencyRate.symbol, "NGN");
    });

  group("updateFromCurrencyRate", () {
    test("An empty value is passed in", () {
      sut.updateFromCurrencyRate("");

      expect(sut.fromCurrencyRate.rate, 1);
    });

    test("A valid value is passed in", () {
      sut.updateFromCurrencyRate("300");

      expect(sut.fromCurrencyRate.rate, 300);
    });
  });

  test("calculateConversionRate", () async {
    initialCurrencyViewModelWithData();

    await sut.fetchLatestCurrencyRates();

    sut.calculateConversionRate();

    expect(sut.toCurrencyRate.rate, 1.0);
  });

}
