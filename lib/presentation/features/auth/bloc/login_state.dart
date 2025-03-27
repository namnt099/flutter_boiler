import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:base/domain/domain.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default(false) bool isLoading,
    String? errorMessage,
    User? user,
  }) = _LoginState;
} 