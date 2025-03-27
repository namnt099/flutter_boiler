abstract class HomeEvent {
  const HomeEvent();
}

class HomeStarted extends HomeEvent {
  const HomeStarted();
}

class LogoutRequested extends HomeEvent {
  const LogoutRequested();
} 