import 'package:base/domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

/// Base class for all use case inputs
@immutable
abstract class BaseInput {
  const BaseInput();
}

/// Base class for all use case outputs
@immutable
abstract class BaseOutput {
  const BaseOutput();
}

/// No parameters use case input
class NoInput extends BaseInput {
  const NoInput();
}

/// No parameters use case output
class NoOutput extends BaseOutput {
  const NoOutput();
}

/// Base use case interface
abstract class BaseUseCase<Input, Output> {
  const BaseUseCase();

  /// Execute the use case
  dynamic call(Input input);
}

/// Base use case interface for Future operations
abstract class FutureUseCase<Input, Output> extends BaseUseCase<Input, Output> {
  const FutureUseCase();

  @override
  Future<Result<Output>> call(Input input);
}

/// Base use case interface for Stream operations
abstract class StreamUseCase<Input, Output> extends BaseUseCase<Input, Output> {
  const StreamUseCase();

  @override
  Stream<Output> call(Input input);
}

/// Base use case with no input for Future operations
abstract class FutureUseCaseNoInput<Output> extends FutureUseCase<NoInput, Output> {
  const FutureUseCaseNoInput();

  @override
  Future<Result<Output>> call(NoInput input);
}

/// Base use case with no input for Stream operations
abstract class StreamUseCaseNoInput<Output> extends StreamUseCase<NoInput, Output> {
  const StreamUseCaseNoInput();

  @override
  Stream<Output> call(NoInput input);
}

/// Base use case with no output for Future operations
abstract class FutureUseCaseNoOutput<Input> extends FutureUseCase<Input, void> {
  const FutureUseCaseNoOutput();

  @override
  Future<Result<void>> call(Input input);
}

/// Base use case with no output for Stream operations
abstract class StreamUseCaseNoOutput<Input> extends StreamUseCase<Input, void> {
  const StreamUseCaseNoOutput();

  @override
  Stream<void> call(Input input);
}

/// Base use case with no input and no output for Future operations
abstract class FutureUseCaseNoInputNoOutput extends FutureUseCase<NoInput, void> {
  const FutureUseCaseNoInputNoOutput();

  @override
  Future<Result<void>> call(NoInput input);
}

/// Base use case with no input and no output for Stream operations
abstract class StreamUseCaseNoInputNoOutput extends StreamUseCase<NoInput, void> {
  const StreamUseCaseNoInputNoOutput();

  @override
  Stream<void> call(NoInput input);
}
