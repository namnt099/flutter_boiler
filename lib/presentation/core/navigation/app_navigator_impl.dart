import 'package:go_router/go_router.dart';
import 'package:base/domain/base/navigation/app_navigator.dart';

/// Implementation of AppNavigator using GoRouter
class AppNavigatorImpl implements AppNavigator {
  final GoRouter _router;

  AppNavigatorImpl(this._router);

  /// Get the current router
  GoRouter get router => _router;

  @override
  void goTo(String location) {
    _router.go(location);
  }

  @override
  void goToAndReplace(String location) {
    _router.go(location);
  }

  @override
  void pushTo(String location) {
    _router.push(location);
  }

  @override
  void pop() {
    _router.pop();
  }

  @override
  void popWithResult<T>(T result) {
    _router.pop(result);
  }

  @override
  bool canPop() {
    return _router.canPop();
  }

  @override
  String get currentLocation =>
      _router.routerDelegate.currentConfiguration.uri.path;

  @override
  String get currentRouteName {
    final location = currentLocation;
    return location.split('/').last;
  }

  @override
  bool isOnRoute(String routeName) {
    return currentRouteName == routeName;
  }

  @override
  Map<String, String> get currentParams {
    return _router.routerDelegate.currentConfiguration.extra
            as Map<String, String>? ??
        {};
  }

  @override
  String? getParam(String key) {
    return currentParams[key];
  }
}
