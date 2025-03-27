import '../../../../domain/domain.dart';

import '../../data.dart';

class AuthRepositoryImpl extends AuthRepository {
  final FirebaseAuthService _firebaseAuth;

  const AuthRepositoryImpl(this._firebaseAuth);

  @override
  Future<Result<User>> login({
    required String email,
    required String password,
  }) {
    return ResultHandler.runCatching(
      () => _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      ),
      (credential) {
        final user = credential.user;
        if (user == null) {
          throw const AuthException(
            kind: ErrorKind.authError,
            message: 'User not found',
          );
        }
        return UserMapper.toEntity(UserDto.fromFirebaseUser(user));
      },
    );
  }

  @override
  Future<Result<User>> register({
    required String email,
    required String password,
    String? displayName,
  }) {
    return ResultHandler.runCatching(
      () => _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ),
      (credential) async {
        final user = credential.user;
        if (user == null) {
          throw const AuthException(
            kind: ErrorKind.authError,
            message: 'Failed to create user',
          );
        }

        if (displayName != null) {
          await user.updateDisplayName(displayName);
        }

        return UserMapper.toEntity(UserDto.fromFirebaseUser(user));
      },
    );
  }

  @override
  Future<Result<void>> logout() {
    return ResultHandler.runCatching(
      () => _firebaseAuth.signOut(),
      (_) => null,
    );
  }

  @override
  Future<Result<void>> resetPassword(String email) {
    return ResultHandler.runCatching(
      () => _firebaseAuth.sendPasswordResetEmail(email),
      (_) => null,
    );
  }

  @override
  Future<Result<User>> getCurrentUser() {
    return ResultHandler.runCatching(
      () => _firebaseAuth.getCurrentUser(),
      (user) => user != null
          ? UserMapper.toEntity(UserDto.fromFirebaseUser(user))
          : const User(id: '', email: ''),
    );
  }
}
