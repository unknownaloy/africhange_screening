// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'convert_rate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConvertRate _$ConvertRateFromJson(Map<String, dynamic> json) => ConvertRate(
      timestamp: json['timestamp'] as int,
      rate: json['rate'] as num,
    );

Map<String, dynamic> _$ConvertRateToJson(ConvertRate instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp,
      'rate': instance.rate,
    };
