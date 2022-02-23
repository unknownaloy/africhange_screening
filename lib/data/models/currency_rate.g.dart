// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_rate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyRate _$CurrencyRateFromJson(Map<String, dynamic> json) => CurrencyRate(
      symbol: json['symbol'] as String,
      rate: json['rate'] as num,
    );

Map<String, dynamic> _$CurrencyRateToJson(CurrencyRate instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'rate': instance.rate,
    };
