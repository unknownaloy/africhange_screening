import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'convert_rate.g.dart';

@JsonSerializable()
class ConvertRate extends Equatable {
  final int timestamp;
  final num rate;

  const ConvertRate({required this.timestamp, required this.rate});

  factory ConvertRate.fromJson(Map<String, dynamic> json) =>
      _$ConvertRateFromJson(json);
  Map<String, dynamic> toJson() => _$ConvertRateToJson(this);

  @override
  List<Object> get props => [timestamp, rate];
}