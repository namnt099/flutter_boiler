import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:base/domain/domain.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final LogoutUseCase _logoutUseCase;
  final GetUserUseCase _getUserUseCase;
  final AppNavigator _navigator;
  HomeBloc(this._logoutUseCase, this._getUserUseCase, this._navigator)
      : super(const HomeState()) {
    on<HomeStarted>(_onHomeStarted);
    on<LogoutRequested>(_onLogoutRequested);
  }

  Future<void> _onHomeStarted(
    HomeStarted event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await _getUserUseCase(const GetUserInput());
    result.when(
      success: (user) => emit(state.copyWith(user: user, isLoading: false)),
      failure: (error) => emit(state.copyWith(errorMessage: error.message, isLoading: false)),
    );

  }

  Future<void> _onLogoutRequested(
    LogoutRequested event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final result = await _logoutUseCase(const NoInput());

    result.when(
      success: (_) {
        _navigator.goTo('/login');
        emit(state.copyWith(isLoggedOut: true, isLoading: false));
      },
      failure: (error) => emit(state.copyWith(errorMessage: error.message)),
    );
  }
}
