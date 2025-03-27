import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:base/domain/domain.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _loginUseCase;
  final AppNavigator _navigator;

  LoginBloc(this._loginUseCase, this._navigator) : super(const LoginState()) {
    on<Login>(_onLogin);
    on<Reset>(_onReset);
  }

  FutureOr<void> _onLogin(Login event, Emitter<LoginState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final result = await _loginUseCase(
      LoginInput(
        email: event.email,
        password: event.password,
      ),
    );

    result.when(
      success: (user) {
        _navigator.goTo('/home');
        emit(state.copyWith(
          isLoading: false,
          user: user,
        ));
      },
      failure: (error) {
        emit(state.copyWith(isLoading: false, errorMessage: error.message));
      },
    );
  }

  void _onReset(Reset event, Emitter<LoginState> emit) {
    emit(const LoginState());
  }
}
