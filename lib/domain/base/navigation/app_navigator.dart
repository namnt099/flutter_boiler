/// Abstract class for navigation in the app
/// This makes navigation testable and centralized
abstract class AppNavigator {
  /// Navigate to a route
  void goTo(String location);

  /// Navigate to a route and replace the current route
  void goToAndReplace(String location);

  /// Navigate to a route and push it on top of the current route
  void pushTo(String location);

  /// Pop the current route
  void pop();

  /// Pop the current route and return a value
  void popWithResult<T>(T result);

  /// Check if we can pop the current route
  bool canPop();

  /// Get the current location
  String get currentLocation;

  /// Get the current route name
  String get currentRouteName;

  /// Check if we're on a specific route
  bool isOnRoute(String routeName);

  /// Get the current route parameters
  Map<String, String> get currentParams;

  /// Get a specific route parameter
  String? getParam(String key);
} 