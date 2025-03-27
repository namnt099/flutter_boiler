import 'package:base/domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(false) bool isLoading,
    @Default(false) bool isLoggedOut,
    String? errorMessage,
    User? user,
  }) = _HomeState;
}

  


