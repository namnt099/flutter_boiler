import 'package:injectable/injectable.dart';

import '../../di/injection.dart';
import '../../domain/domain.dart';
import '../presentation.dart';


@module
abstract class PresentationModule {
  @injectable
  LoginBloc get loginBloc => LoginBloc(getIt<LoginUseCase>(), getIt<AppNavigator>());

  @injectable
  HomeBloc get homeBloc => HomeBloc(getIt<LogoutUseCase>(), getIt<GetUserUseCase>(), getIt<AppNavigator>());

  @injectable
  AppNavigator get appNavigator => AppNavigatorImpl(router);
}
