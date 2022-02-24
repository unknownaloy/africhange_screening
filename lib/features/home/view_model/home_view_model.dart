import 'package:africhange_screening/data/models/currency_rate.dart';
import 'package:africhange_screening/data/repository/currency_repository.dart';
import 'package:africhange_screening/enums/request_state.dart';
import 'package:africhange_screening/utils/failure.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  final CurrencyRepository _currencyService;

  HomeViewModel({required CurrencyRepository currencyRepository})
      : _currencyService = currencyRepository;

  List<CurrencyRate> _currencyRates = [];
  List<CurrencyRate> get currencyRates => [..._currencyRates];

  RequestState _requestState = const RequestState.idle();
  RequestState get requestState => _requestState;

  String _fromCurrency = "EUR";
  String get fromCurrency => _fromCurrency;

  String _toCurrency = "NGN";
  String get toCurrency => _toCurrency;

  num _fromCurrencyRate = 0;
  num get fromCurrencyRate => _fromCurrencyRate;

  num _toCurrencyRate = 0;
  num get toCurrencyRate => _toCurrencyRate;

  // CurrencyRate _testingOne = CurrencyRate(
  //   symbol: "EUR",
  //   rate: 0,
  // );

  void fetchLatestCurrencyRates() async {
    try {
      _requestState = const RequestState.loading();

      _currencyRates = await _currencyService.getLatestCurrencyRates();

      _requestState = const RequestState.success();
      notifyListeners();
    } on Failure catch (e) {
      _requestState = RequestState.error(error: e.message);
      notifyListeners();
    }
  }

  void swapFromAndToCurrencies() {
    final previousFromCurrency = _fromCurrency;
    final previousToCurrency = _toCurrency;

    _fromCurrency = previousToCurrency;
    _toCurrency = previousFromCurrency;
    notifyListeners();
  }

  void updateFromCurrencyOption(String? option) {
    if (option == null) {
      return;
    }

    if (option == _toCurrency) {
      _toCurrency = _fromCurrency;
    }

    _fromCurrency = option;
    notifyListeners();
  }

  void updateToCurrencyOption(String? option) {
    if (option == null) {
      return;
    }

    if (option == _fromCurrency) {
      _fromCurrency = _toCurrency;
    }

    _toCurrency = option;
    notifyListeners();
  }

  void updateFromCurrencyRate(String value) {
    if (value.isEmpty) {
      return;
    }

    final amount = int.parse(value);
    _fromCurrencyRate = amount;
  }

  void convertCurrency() {

  }
}
