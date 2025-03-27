import 'package:injectable/injectable.dart';

import '../../di/injection.dart';
import '../domain.dart';

@module
abstract class DomainModule {
  @singleton
  LoginUseCase get loginUseCase => LoginUseCase(
        getIt<AuthRepository>(),
      );

  @singleton
  RegisterUseCase get registerUseCase =>
      RegisterUseCase(getIt<AuthRepository>());

  @singleton
  LogoutUseCase get logoutUseCase => LogoutUseCase(
        getIt<AuthRepository>(),
        getIt<AppNavigator>(),
      );

  @singleton
  GetUserUseCase get getUserUseCase => GetUserUseCase(
        getIt<AuthRepository>(),
      );
}
