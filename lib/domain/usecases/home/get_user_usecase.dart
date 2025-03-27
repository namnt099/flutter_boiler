import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain.dart';

part 'get_user_usecase.freezed.dart';

@freezed
class GetUserInput with _$GetUserInput {
  const factory GetUserInput() = _GetUserInput;
}

class GetUserUseCase extends FutureUseCase<GetUserInput, User> {
  final AuthRepository _repository;

  const GetUserUseCase(this._repository);

  @override
  Future<Result<User>> call(GetUserInput input) async {
    final result = await _repository.getCurrentUser();

    return result.when(
      success: (user) => Result.success(user),
      failure: (error) {
        return Result.failure(error);
      },
    );
  }
}
