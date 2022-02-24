import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:africhange_screening/config/api_config/currency_apis.dart';
import 'package:africhange_screening/config/api_keys/fixer_api_key.dart';
import 'package:africhange_screening/data/models/currency_rate.dart';
import 'package:africhange_screening/domain/currency_repository_interface.dart';
import 'package:africhange_screening/utils/failure.dart';
import 'package:http/http.dart' as http;

class CurrencyRepository implements CurrencyRepositoryInterface {
  final http.Client _client;

  CurrencyRepository({required http.Client client}) : _client = client;

  @override
  Future<List<CurrencyRate>> getLatestCurrencyRates() async {
    try {
      Map<String, String> queryParams = {
        "access_key": kFixerApiKey,
      };

      var url = Uri.parse(getLatestCurrencyRateUrl)
          .replace(queryParameters: queryParams);

      final response = await _client.get(url);

      final decodedData = jsonDecode(response.body);

      if (decodedData["success"] == true) {
        final rates = decodedData["rates"] as Map<String, dynamic>;

        List<CurrencyRate> currentRates = rates.entries
            .map(
              (rate) => CurrencyRate(
                symbol: rate.key,
                rate: rate.value,
              ),
            )
            .toList();

        return currentRates;
      } else {
        throw Failure(decodedData["message"]);
      }
    } on SocketException catch (_) {
      throw Failure("No internet connection");
    } on HttpException {
      throw Failure("Service not currently available");
    } on TimeoutException catch (_) {
      throw Failure("Poor internet connection");
    } on Failure catch (e) {
      throw Failure(e.message);
    } catch (e) {
      throw Failure("Something went wrong. Try again - $e");
    }
  }

  @override
  Future<List<num>> getPriceHistoricRange(List<String> dateRange) async {
    try {
      List<num> result = [];

      for (String date in dateRange) {
        Map<String, String> queryParams = {
          "access_key": kFixerApiKey,
          "base": "EUR",
          "symbols": "NGN",
        };

        final injectedUrl = "$getHistoricalRateUrl/$date";

        print("CurrencyRepository -> getPriceHistoricRange == injectedUrl -- $injectedUrl");

        var url = Uri.parse(injectedUrl).replace(queryParameters: queryParams);

        final response = await _client.get(url);

        final decodedData = jsonDecode(response.body);

        print("CurrencyRepository -> getPriceHistoricRange == decodedData -- $decodedData");

        if (decodedData["success"] == true) {
          final rate = decodedData["rates"] as Map<String, dynamic>;

          print("CurrencyRepository -> getPriceHistoricRange == rate -- $rate");

          num value = rate.entries.map((e) => e.value as num).first;

          print("CurrencyRepository -> getPriceHistoricRange == value -- $value");

          result.add(value);
        }
      }

      print("CurrencyRepository -> getPriceHistoricRange == result -- $result");

      return result;
    } on SocketException catch (_) {
      throw Failure("No internet connection");
    } on HttpException {
      throw Failure("Service not currently available");
    } on TimeoutException catch (_) {
      throw Failure("Poor internet connection");
    } on Failure catch (e) {
      throw Failure(e.message);
    } catch (e) {
      throw Failure("Something went wrong. Try again - $e");
    }
  }
}
