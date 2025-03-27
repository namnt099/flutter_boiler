import 'package:base/domain/domain.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:base/presentation/features/auth/bloc/login_bloc.dart';
import 'package:base/presentation/features/auth/bloc/login_event.dart';
import 'package:base/presentation/features/auth/bloc/login_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLoginUseCase extends Mock implements LoginUseCase {}

class MockAppNavigator extends Mock implements AppNavigator {}

void main() {
  late MockLoginUseCase mockLoginUseCase;
  late MockAppNavigator mockAppNavigator;
  setUp(() {
    mockLoginUseCase = MockLoginUseCase();
    mockAppNavigator = MockAppNavigator();
  });

  setUpAll(() {
    registerFallbackValue(const LoginInput(email: '', password: ''));
  });

  group('LoginBloc', () {
    const tEmail = 'test@example.com';
    const tPassword = 'password123';
    const tUser = User(id: '1', email: tEmail);
    blocTest<LoginBloc, LoginState>(
      'emits [loading, success] when login succeeds',
      build: () {
        when(() => mockLoginUseCase(captureAny()))
            .thenAnswer((_) async => const Result.success(tUser));
        return LoginBloc(mockLoginUseCase, mockAppNavigator);
      },
      act: (bloc) => bloc.add(Login(email: tEmail, password: tPassword)),
      expect: () => [
        const LoginState(isLoading: true),
        const LoginState(isLoading: false, user: tUser),
      ],
      verify: (_) {
        verify(() => mockLoginUseCase.call(const LoginInput(
              email: tEmail,
              password: tPassword,
            ))).called(1);
        verify(() => mockAppNavigator.goTo('/home')).called(1);
      },
    );

    blocTest<LoginBloc, LoginState>(
      'emits [loading, error] when login fails',
      build: () {
        when(() => mockLoginUseCase(captureAny())).thenAnswer((_) async =>
            const Result.failure(ApiException(message: 'Login failed')));
        return LoginBloc(mockLoginUseCase, mockAppNavigator);
      },
      act: (bloc) => bloc.add(Login(email: tEmail, password: tPassword)),
      expect: () => [
        const LoginState(isLoading: true),
        const LoginState(isLoading: false, errorMessage: 'Login failed'),
      ],
      verify: (_) {
        verify(() => mockLoginUseCase.call(const LoginInput(
              email: tEmail,
              password: tPassword,
            ))).called(1);
      },
    );
  });
}
