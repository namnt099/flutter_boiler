import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:base/domain/domain.dart';

import '../../di/injection.dart';
import '../data.dart';

@module
abstract class DataModule {
  @injectable
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();

  @singleton
  FirebaseAuthService get firebaseAuthService => FirebaseAuthService();
  @injectable
  AuthRepository get authRepository =>
      AuthRepositoryImpl(getIt<FirebaseAuthService>());
}
