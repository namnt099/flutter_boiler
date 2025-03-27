import '../../domain.dart';

class LogoutUseCase extends FutureUseCase<NoInput, void> {
  final AuthRepository _repository;
  final AppNavigator _navigator;

  const LogoutUseCase(this._repository, this._navigator);

  @override
  Future<Result<void>> call(NoInput input) async {
    final result = await _repository.logout();

    return result.when(
      success: (_) {
        _navigator.goTo('/login');
        return const Result.success(null);
      },
      failure: (error) => Result.failure(error),
    );
  }
}
