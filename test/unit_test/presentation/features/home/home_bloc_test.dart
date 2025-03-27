import 'package:base/domain/domain.dart';
import 'package:base/presentation/presentation.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLogoutUseCase extends Mock implements LogoutUseCase {}

class MockGetUserUseCase extends Mock implements GetUserUseCase {}

class MockAppNavigator extends Mock implements AppNavigator {}

void main() {
  late MockLogoutUseCase mockLogoutUseCase;
  late MockGetUserUseCase mockGetUserUseCase;
  late MockAppNavigator mockAppNavigator;

  setUp(() {
    mockLogoutUseCase = MockLogoutUseCase();
    mockGetUserUseCase = MockGetUserUseCase();
    mockAppNavigator = MockAppNavigator();
  });

  setUpAll(() {
    registerFallbackValue(const NoInput());
    registerFallbackValue(const GetUserInput());
  });

  blocTest<HomeBloc, HomeState>(
    'Test logout',
    build: () {
      when(() => mockLogoutUseCase(captureAny()))
          .thenAnswer((_) async => const Result.success(null));
      return HomeBloc(mockLogoutUseCase, mockGetUserUseCase, mockAppNavigator);
    },
    act: (bloc) => bloc.add(const LogoutRequested()),
    expect: () => [
      const HomeState(isLoading: true),
      const HomeState(isLoading: false, isLoggedOut: true),
    ],
    verify: (_) {
      verify(() => mockLogoutUseCase.call(captureAny())).called(1);
      verify(() => mockAppNavigator.goTo('/login')).called(1);
    },
  );

  blocTest<HomeBloc, HomeState>(
    'Test get user',
    build: () {
      when(() => mockGetUserUseCase(captureAny())).thenAnswer((_) async => const Result.success(User(id: '1', email: 'test@example.com')));
      return HomeBloc(mockLogoutUseCase, mockGetUserUseCase, mockAppNavigator);
    },
    act: (bloc) => bloc.add(const HomeStarted()),
    expect: () => [
      const HomeState(isLoading: true),
      const HomeState(isLoading: false, user: User(id: '1', email: 'test@example.com')),
    ],
    verify: (_) {
      verify(() => mockGetUserUseCase.call(captureAny())).called(1);
    },
  );

  blocTest<HomeBloc, HomeState>(
    'Test get user failure',
    build: () {
      when(() => mockGetUserUseCase(captureAny())).thenAnswer((_) async => const Result.failure(ApiException(message: 'Error')));
      return HomeBloc(mockLogoutUseCase, mockGetUserUseCase, mockAppNavigator);
    },
    act: (bloc) => bloc.add(const HomeStarted()),
    expect: () => [
      const HomeState(isLoading: true),
      const HomeState(isLoading: false, errorMessage: 'Error'),
    ],
    verify: (_) {
      verify(() => mockGetUserUseCase.call(captureAny())).called(1);
    },
  );
}
