import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency_rate.g.dart';

@JsonSerializable()
class CurrencyRate extends Equatable {
  final String symbol;
  final num rate;

  const CurrencyRate({
    required this.symbol,
    required this.rate,
  });

  factory CurrencyRate.fromJson(Map<String, dynamic> json) =>
      _$CurrencyRateFromJson(json);
  Map<String, dynamic> toJson() => _$CurrencyRateToJson(this);

  @override
  List<Object> get props => [symbol, rate];
}
