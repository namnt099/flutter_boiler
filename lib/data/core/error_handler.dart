import 'package:firebase_auth/firebase_auth.dart';

import '../../generated/l10n.dart';
import '../../domain/domain.dart';

class ErrorHandler {


  static Result<T> handleException<T>(dynamic error) {
    return Result.failure(mapToAppException(error));
  }

  

 static AppException mapToAppException(dynamic error) {
    if (error is AppException) {
      return error;
    }

    if (error is FirebaseAuthException) {
      return _mapFirebaseAuthException(error);
    }

    if (error is FirebaseException) {
      return ServerException(
        message: error.message ?? S.current.errorServer,
        code: error.code,
        originalError: error,
      );
    }

    if (error is Exception) {
      return ServerException(
        message: error.toString(),
        originalError: error,
      );
    }

    return ServerException(
      message: S.current.errorServer,
      originalError: error,
    );
  }

 static AppException _mapFirebaseAuthException(FirebaseAuthException error) {
    switch (error.code) {
      case 'invalid-email':
        return ValidationException(
          kind: ErrorKind.invalidEmail,
          message: S.current.errorInvalidEmail,
          code: error.code,
          originalError: error,
        );
      case 'user-disabled':
        return AuthException(
          kind: ErrorKind.userDisabled,
          message: S.current.errorUserDisabled,
          code: error.code,
          originalError: error,
        );
      case 'user-not-found':
        return AuthException(
          kind: ErrorKind.userNotFound,
          message: S.current.errorUserNotFound,
          code: error.code,
          originalError: error,
        );
      case 'wrong-password':
        return ValidationException(
          kind: ErrorKind.invalidPassword,
          message: S.current.errorInvalidPassword,
          code: error.code,
          originalError: error,
        );
      case 'email-already-in-use':
        return ValidationException(
          kind: ErrorKind.emailInUse,
          message: S.current.errorEmailInUse,
          code: error.code,
          originalError: error,
        );
      case 'operation-not-allowed':
        return AuthException(
          kind: ErrorKind.authError,
          message: S.current.errorOperationNotAllowed,
          code: error.code,
          originalError: error,
        );
      case 'weak-password':
        return ValidationException(
          kind: ErrorKind.weakPassword,
          message: S.current.errorWeakPassword,
          code: error.code,
          originalError: error,
        );
      default:
        return AuthException(
          kind: ErrorKind.authError,
          message: error.message ?? S.current.errorServer,
          code: error.code,
          originalError: error,
        );
    }
  }
}
