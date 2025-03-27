import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain.dart';

part 'login_usecase.freezed.dart';

class LoginUseCase extends FutureUseCase<LoginInput, User> {
  final AuthRepository _repository;

  const LoginUseCase(this._repository);

  @override
  Future<Result<User>> call(LoginInput input) async {
    final result = await _repository.login(
      email: input.email,
      password: input.password,
    );

    return result.when(
      success: (user) {
        return Result.success(user);
      },
      failure: (error) => Result.failure(error),
    );
  }
}

@freezed
class LoginInput with _$LoginInput {
  const factory LoginInput({
    required String email,
    required String password,
  }) = _LoginInput;
}
