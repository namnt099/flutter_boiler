// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../data/data.dart' as _i433;
import '../data/di/data_module.dart' as _i748;
import '../domain/di/domain_module.dart' as _i164;
import '../domain/domain.dart' as _i515;
import '../presentation/di/presentation_module.dart' as _i804;
import '../presentation/presentation.dart' as _i159;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dataModule = _$DataModule();
    final presentationModule = _$PresentationModule();
    final domainModule = _$DomainModule();
    gh.factoryAsync<_i460.SharedPreferences>(
        () => dataModule.sharedPreferences);
    gh.factory<_i515.AuthRepository>(() => dataModule.authRepository);
    gh.factory<_i159.LoginBloc>(() => presentationModule.loginBloc);
    gh.factory<_i159.HomeBloc>(() => presentationModule.homeBloc);
    gh.factory<_i515.AppNavigator>(() => presentationModule.appNavigator);
    gh.singleton<_i433.FirebaseAuthService>(
        () => dataModule.firebaseAuthService);
    gh.singleton<_i515.LoginUseCase>(() => domainModule.loginUseCase);
    gh.singleton<_i515.RegisterUseCase>(() => domainModule.registerUseCase);
    gh.singleton<_i515.LogoutUseCase>(() => domainModule.logoutUseCase);
    gh.singleton<_i515.GetUserUseCase>(() => domainModule.getUserUseCase);
    return this;
  }
}

class _$DataModule extends _i748.DataModule {}

class _$PresentationModule extends _i804.PresentationModule {}

class _$DomainModule extends _i164.DomainModule {}
