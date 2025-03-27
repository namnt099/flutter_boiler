import 'package:freezed_annotation/freezed_annotation.dart';

import '../domain.dart';

part 'result.freezed.dart';

@freezed
class Result<T> with _$Result<T> {
  const factory Result.success(T data) = Success<T>;
  const factory Result.failure(AppException error) = Failure<T>;

  const Result._();

  bool get isSuccess => maybeWhen(
        success: (_) => true,
        failure: (_) => false,
        orElse: () => false,
      );

  bool get isFailure => !isSuccess;

  T getOrThrow() => maybeWhen(
        success: (data) => data,
        failure: (error) => throw Exception(error),
        orElse: () => throw Exception('Unknown error'),
      );

  T? getOrNull() => maybeWhen(
        success: (data) => data,
        failure: (_) => null,
        orElse: () => null,
      );

  String? getErrorOrNull() => maybeWhen(
        success: (_) => null,
        failure: (error) => error.message,
        orElse: () => null,
      );

  @override
  String toString() => maybeWhen(
        success: (data) => 'Success(data: $data)',
        failure: (error) => 'Failure(error: $error)',
        orElse: () => 'Unknown state',
      );
}
