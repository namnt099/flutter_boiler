/// Enum defining different types of errors
enum ErrorKind {
  // Network errors
  networkError,
  timeoutError,
  serverError,
  apiError,

  // Local errors
  cacheError,
  databaseError,
  secureStorageError,
  fileError,

  // Auth errors
  authError,
  unauthorizedError,
  forbiddenError,

  // Validation errors
  validationError,
  invalidEmail,
  invalidPassword,
  weakPassword,
  emailInUse,
  userNotFound,
  userDisabled,

  // Other errors
  notFoundError,
  parsingError,
  configurationError,
  unknownError,
}

/// Base exception class for the application
class AppException implements Exception {
  final ErrorKind kind;
  final String message;
  final String? code;
  final dynamic originalError;

  const AppException({
    required this.kind,
    required this.message,
    this.code,
    this.originalError,
  });

  @override
  String toString() => message;
}

/// Exception thrown when there's an error in remote data operations
class RemoteException extends AppException {
  const RemoteException({
    required super.kind,
    required super.message,
    super.code,
    super.originalError,
  });
}

/// Exception thrown when there's a network error
class NetworkException extends RemoteException {
  const NetworkException({
    required super.message,
    super.code,
    super.originalError,
  }) : super(kind: ErrorKind.networkError);
}

/// Exception thrown when there's an error in API calls
class ApiException extends RemoteException {
  final int? statusCode;
  final dynamic response;

  const ApiException({
    required super.message,
    super.code,
    this.statusCode,
    this.response,
    super.originalError,
  }) : super(kind: ErrorKind.apiError);
}

/// Exception thrown when there's an error in local data operations
class LocalException extends AppException {
  const LocalException({
    required super.kind,
    required super.message,
    super.code,
    super.originalError,
  });
}

/// Exception thrown when there's an error in cache operations
class CacheException extends LocalException {
  const CacheException({
    required super.message,
    super.code,
    super.originalError,
  }) : super(kind: ErrorKind.cacheError);
}

/// Exception thrown when there's an error in database operations
class DatabaseException extends LocalException {
  const DatabaseException({
    required super.message,
    super.code,
    super.originalError,
  }) : super(kind: ErrorKind.databaseError);
}

/// Exception thrown when there's an error in secure storage operations
class SecureStorageException extends LocalException {
  const SecureStorageException({
    required super.message,
    super.code,
    super.originalError,
  }) : super(kind: ErrorKind.secureStorageError);
}

/// Exception thrown when there's a validation error
class ValidationException extends AppException {
  const ValidationException({
    required super.kind,
    required super.message,
    super.code,
    super.originalError,
  });
}

/// Exception thrown when there's an authentication error
class AuthException extends AppException {
  const AuthException({
    required super.kind,
    required super.message,
    super.code,
    super.originalError,
  });
}

/// Exception thrown when there's an authorization error
class AuthorizationException extends AppException {
  const AuthorizationException({
    required super.message,
    super.code,
    super.originalError,
  }) : super(kind: ErrorKind.unauthorizedError);
}

/// Exception thrown when a resource is not found
class NotFoundException extends AppException {
  const NotFoundException({
    required super.message,
    super.code,
    super.originalError,
  }) : super(kind: ErrorKind.notFoundError);
}

/// Exception thrown when there's a server error
class ServerException extends RemoteException {
  const ServerException({
    required super.message,
    super.code,
    super.originalError,
  }) : super(kind: ErrorKind.serverError);
}

/// Exception thrown when there's a timeout error
class TimeoutException extends RemoteException {
  const TimeoutException({
    required super.message,
    super.code,
    super.originalError,
  }) : super(kind: ErrorKind.timeoutError);
}

/// Exception thrown when there's a parsing error
class ParsingException extends AppException {
  const ParsingException({
    required super.message,
    super.code,
    super.originalError,
  }) : super(kind: ErrorKind.parsingError);
}

/// Exception thrown when there's a configuration error
class ConfigurationException extends AppException {
  const ConfigurationException({
    required super.message,
    super.code,
    super.originalError,
  }) : super(kind: ErrorKind.configurationError);
}

/// Exception thrown when there's an error in file operations
class FileException extends LocalException {
  const FileException({
    required super.message,
    super.code,
    super.originalError,
  }) : super(kind: ErrorKind.fileError);
} 