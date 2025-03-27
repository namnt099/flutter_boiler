
import '../../domain.dart';

/// Interface for authentication repository
abstract class AuthRepository extends BaseRepository {
  const AuthRepository();

  /// Login with email and password
  Future<Result<User>> login({
    required String email,
    required String password,
  });

  /// Register with email and password
  Future<Result<User>> register({
    required String email,
    required String password,
    String? displayName,
  });

  /// Logout current user
  Future<Result<void>> logout();

  /// Reset password
  Future<Result<void>> resetPassword(String email);

  /// Get current user
  Future<Result<User>> getCurrentUser();
} 