import 'dart:async';
import 'package:base/data/core/error_handler.dart';

import '../../domain/base/result.dart';

class ResultHandler {
  static Future<Result<T>> runCatching<T, R>(
    Future<R> Function() action,
    FutureOr<T> Function(R) mapper,
  ) async {
    try {
      final result = await action();
      return Result.success(await mapper(result));
    } catch (e) {
      return Result.failure(ErrorHandler.mapToAppException(e));
    }
  }

  static Future<Result<T?>> runCatchingOrNull<T, R>(
    Future<R?> Function() action,
    FutureOr<T> Function(R) mapper,
  ) async {
    try {
      final result = await action();
      if (result == null) {
        return const Result.success(null);
      }
      return Result.success(await mapper(result));
    } catch (e) {
      return Result.failure(ErrorHandler.mapToAppException(e));
    }
  }
}
