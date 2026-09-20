import 'package:flutter/foundation.dart';

enum SplashStatus {
  loading,
  onboardingRequired,
  onboardingCompleted,
}

@immutable
class SplashState {
  final SplashStatus status;

  const SplashState({this.status = SplashStatus.loading});

  SplashState copyWith({SplashStatus? status}) {
    return SplashState(status: status ?? this.status);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is SplashState && other.status == status;
  }

  @override
  int get hashCode => status.hashCode;
}
