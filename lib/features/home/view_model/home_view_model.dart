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

  var requestState = const RequestState.idle();
  // var get requestState => _requestState;


  void fetchLatestCurrencyRates () async {
    try {
      requestState = const RequestState.loading();
      // notifyListeners();

      _currencyRates = await _currencyService.getLatestCurrencyRates();

      requestState = const RequestState.success();
      notifyListeners();
    } on Failure catch (e) {
      requestState = RequestState.error(error: e.message);
      notifyListeners();
    }
  }
}
