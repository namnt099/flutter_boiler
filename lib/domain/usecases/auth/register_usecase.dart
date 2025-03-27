import '../../domain.dart';

class RegisterUseCase extends FutureUseCase<RegisterInput, User> {
  final AuthRepository _repository;

  const RegisterUseCase(this._repository);

  @override
  Future<Result<User>> call(RegisterInput input) async {
    return await _repository.register(
      email: input.email,
      password: input.password,
      displayName: input.displayName,
    );
  }
}

class RegisterInput {
  final String email;
  final String password;
  final String? displayName;

  const RegisterInput({
    required this.email,
    required this.password,
    this.displayName,
  });
} 