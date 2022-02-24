import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency_rate.freezed.dart';
part 'currency_rate.g.dart';

@freezed
class CurrencyRate extends Equatable with _$CurrencyRate {
  const CurrencyRate._();

  const factory CurrencyRate({
    required String symbol,
    required num rate,
  }) = _CurrencyRate;

  @override
  List<Object?> get props => [symbol, rate];

  factory CurrencyRate.fromJson(Map<String, dynamic> json) =>
      _$CurrencyRateFromJson(json);
}
