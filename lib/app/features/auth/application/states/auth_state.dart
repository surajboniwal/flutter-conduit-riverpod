import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.error({
    String? emailError,
    String? passwordError,
    String? usernameError,
  }) = _Error;
  const factory AuthState.success(String data) = _Success;
}
