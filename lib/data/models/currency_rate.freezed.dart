// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'currency_rate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CurrencyRate _$CurrencyRateFromJson(Map<String, dynamic> json) {
  return _CurrencyRate.fromJson(json);
}

/// @nodoc
class _$CurrencyRateTearOff {
  const _$CurrencyRateTearOff();

  _CurrencyRate call({required String symbol, required num rate}) {
    return _CurrencyRate(
      symbol: symbol,
      rate: rate,
    );
  }

  CurrencyRate fromJson(Map<String, Object?> json) {
    return CurrencyRate.fromJson(json);
  }
}

/// @nodoc
const $CurrencyRate = _$CurrencyRateTearOff();

/// @nodoc
mixin _$CurrencyRate {
  String get symbol => throw _privateConstructorUsedError;
  num get rate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CurrencyRateCopyWith<CurrencyRate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyRateCopyWith<$Res> {
  factory $CurrencyRateCopyWith(
          CurrencyRate value, $Res Function(CurrencyRate) then) =
      _$CurrencyRateCopyWithImpl<$Res>;
  $Res call({String symbol, num rate});
}

/// @nodoc
class _$CurrencyRateCopyWithImpl<$Res> implements $CurrencyRateCopyWith<$Res> {
  _$CurrencyRateCopyWithImpl(this._value, this._then);

  final CurrencyRate _value;
  // ignore: unused_field
  final $Res Function(CurrencyRate) _then;

  @override
  $Res call({
    Object? symbol = freezed,
    Object? rate = freezed,
  }) {
    return _then(_value.copyWith(
      symbol: symbol == freezed
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      rate: rate == freezed
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
abstract class _$CurrencyRateCopyWith<$Res>
    implements $CurrencyRateCopyWith<$Res> {
  factory _$CurrencyRateCopyWith(
          _CurrencyRate value, $Res Function(_CurrencyRate) then) =
      __$CurrencyRateCopyWithImpl<$Res>;
  @override
  $Res call({String symbol, num rate});
}

/// @nodoc
class __$CurrencyRateCopyWithImpl<$Res> extends _$CurrencyRateCopyWithImpl<$Res>
    implements _$CurrencyRateCopyWith<$Res> {
  __$CurrencyRateCopyWithImpl(
      _CurrencyRate _value, $Res Function(_CurrencyRate) _then)
      : super(_value, (v) => _then(v as _CurrencyRate));

  @override
  _CurrencyRate get _value => super._value as _CurrencyRate;

  @override
  $Res call({
    Object? symbol = freezed,
    Object? rate = freezed,
  }) {
    return _then(_CurrencyRate(
      symbol: symbol == freezed
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      rate: rate == freezed
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CurrencyRate implements _CurrencyRate {
  const _$_CurrencyRate({required this.symbol, required this.rate});

  factory _$_CurrencyRate.fromJson(Map<String, dynamic> json) =>
      _$$_CurrencyRateFromJson(json);

  @override
  final String symbol;
  @override
  final num rate;

  @override
  String toString() {
    return 'CurrencyRate(symbol: $symbol, rate: $rate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CurrencyRate &&
            const DeepCollectionEquality().equals(other.symbol, symbol) &&
            const DeepCollectionEquality().equals(other.rate, rate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(symbol),
      const DeepCollectionEquality().hash(rate));

  @JsonKey(ignore: true)
  @override
  _$CurrencyRateCopyWith<_CurrencyRate> get copyWith =>
      __$CurrencyRateCopyWithImpl<_CurrencyRate>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CurrencyRateToJson(this);
  }
}

abstract class _CurrencyRate implements CurrencyRate {
  const factory _CurrencyRate({required String symbol, required num rate}) =
      _$_CurrencyRate;

  factory _CurrencyRate.fromJson(Map<String, dynamic> json) =
      _$_CurrencyRate.fromJson;

  @override
  String get symbol;
  @override
  num get rate;
  @override
  @JsonKey(ignore: true)
  _$CurrencyRateCopyWith<_CurrencyRate> get copyWith =>
      throw _privateConstructorUsedError;
}
