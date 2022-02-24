import 'package:africhange_screening/data/models/currency_rate.dart';
import 'package:africhange_screening/data/repository/currency_repository.dart';
import 'package:africhange_screening/enums/request_state.dart';
import 'package:africhange_screening/utils/date_formatter.dart';
import 'package:africhange_screening/utils/failure.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  final CurrencyRepository _currencyService;

  HomeViewModel({required CurrencyRepository currencyRepository})
      : _currencyService = currencyRepository;

  List<CurrencyRate> _currencyRates = [];
  List<CurrencyRate> get currencyRates => [..._currencyRates];

  List<num> _historicPriceData = [];
  List<num> get historicPriceData => [..._historicPriceData];

  RequestState _requestState = const RequestState.idle();
  RequestState get requestState => _requestState;

  RequestState _historicPriceRequestState = const RequestState.idle();
  RequestState get historicPriceRequestState => _historicPriceRequestState;

  CurrencyRate _fromCurrencyRate = const CurrencyRate(
    symbol: "EUR",
    rate: 1,
  );

  CurrencyRate get fromCurrencyRate => _fromCurrencyRate;

  late CurrencyRate _toCurrencyRate;
  CurrencyRate get toCurrencyRate => _toCurrencyRate;

  void fetchLatestCurrencyRates() async {
    try {
      _requestState = const RequestState.loading();

      _currencyRates = await _currencyService.getLatestCurrencyRates();

      _requestState = const RequestState.success();

      /// Setting the default toCurrency to Naira
      _toCurrencyRate = _currencyRates.firstWhere(
        (currency) => currency.symbol == "NGN",
      );

      notifyListeners();
    } on Failure catch (e) {
      _requestState = RequestState.error(error: e.message);
      notifyListeners();
    }
  }

  void getHistoricPriceRange() async {
    try {
      _historicPriceRequestState = const RequestState.loading();

      _historicPriceData = await _currencyService.getPriceHistoricRange(
        DateFormatter.getDaysInBetween(30),
      );

      _historicPriceRequestState = const RequestState.success();
      notifyListeners();
    } on Failure catch (e) {
      _historicPriceRequestState = RequestState.error(error: e.message);
      notifyListeners();
    }
  }

  void swapFromAndToCurrencies() {
    final previousFromCurrency = _fromCurrencyRate;
    final previousToCurrency = _toCurrencyRate;

    _fromCurrencyRate = previousToCurrency;
    _toCurrencyRate = previousFromCurrency;

    notifyListeners();
  }

  void updateFromCurrencyOption(String? option) {
    if (option == null) {
      return;
    }

    if (option == _toCurrencyRate.symbol) {
      _toCurrencyRate = _fromCurrencyRate;
    }

    _fromCurrencyRate =
        _currencyRates.firstWhere((rate) => rate.symbol == option);
    notifyListeners();
  }

  void updateToCurrencyOption(String? option) {
    if (option == null) {
      return;
    }

    if (option == _fromCurrencyRate.symbol) {
      _fromCurrencyRate = _toCurrencyRate;
    }

    _toCurrencyRate =
        _currencyRates.firstWhere((rate) => rate.symbol == option);
    notifyListeners();
  }

  void updateFromCurrencyRate(String value) {
    if (value.isEmpty) {
      return;
    }

    final amount = int.parse(value);

    final newCurrencyRate = _fromCurrencyRate.copyWith(rate: amount);
    _fromCurrencyRate = newCurrencyRate;
  }

  void calculateConversionRate() {
    final toRate = _currencyRates
        .firstWhere((rate) => rate.symbol == _toCurrencyRate.symbol);

    final convertedRate =
        (_fromCurrencyRate.rate * toRate.rate).toStringAsFixed(2);

    final newToCurrencyRate =
        _toCurrencyRate.copyWith(rate: num.parse(convertedRate));

    _toCurrencyRate = newToCurrencyRate;
    notifyListeners();
  }
}
