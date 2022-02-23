import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_state.freezed.dart';

@freezed
class RequestState with _$RequestState {
  const factory RequestState.idle() = _Idle;
  const factory RequestState.loading() = _Loading;
  const factory RequestState.success() = _Success;
  const factory RequestState.error({
    required String error,
  }) = _Error;
}
