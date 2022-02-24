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

  /// This variable holds the list of currencies and their current rates
  List<CurrencyRate> _currencyRates = [];
  List<CurrencyRate> get currencyRates => [..._currencyRates];

  /// This variable holds the list of rates over a 30 day period of "EUR" -> Euro
  /// to "NGN" Naira
  List<num> _historicPriceData = [];
  List<num> get historicPriceData => [..._historicPriceData];

  /// This is the query state of fetch request for getting the [_currencyRates]
  /// data
  RequestState _requestState = const RequestState.idle();
  RequestState get requestState => _requestState;

  /// This is the query state of fetch request for getting the [_historicPriceData]
  /// data
  RequestState _historicPriceRequestState = const RequestState.idle();
  RequestState get historicPriceRequestState => _historicPriceRequestState;

  /// The default from currency. Defaults to "EUR"
  CurrencyRate _fromCurrencyRate = const CurrencyRate(
    symbol: "EUR",
    rate: 1,
  );
  CurrencyRate get fromCurrencyRate => _fromCurrencyRate;

  /// The value for the to current rate.
  ///
  /// NOTE: The value of this is initialized after a successfully querying for
  /// the [_currencyRates] data
  late CurrencyRate _toCurrencyRate;
  CurrencyRate get toCurrencyRate => _toCurrencyRate;

  /// Method for fetching the [_currencyRates] data
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

  /// Method responsible for updating the [_fromCurrencyRate] from the dropdown
  /// options
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

  /// Method responsible for updating the [_toCurrencyRate] from the dropdown
  /// options
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

  /// Method responsible for updating the [_fromCurrencyState] from the user's
  /// inputted values
  void updateFromCurrencyRate(String value) {
    if (value.isEmpty) {
      return;
    }

    final amount = int.parse(value);

    final newCurrencyRate = _fromCurrencyRate.copyWith(rate: amount);
    _fromCurrencyRate = newCurrencyRate;
  }


  /// Method responsible for calculating the currency rates of the selected
  /// currencies by the user
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
