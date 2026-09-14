import 'dart:async';

import 'package:flutter/foundation.dart';

class SplashViewModel extends ChangeNotifier {
  static const Duration splashDuration = Duration(seconds: 10);

  Timer? _timer;
  bool _isFinished = false;

  bool get isFinished => _isFinished;

  void startSplash() {
    _timer?.cancel();

    _timer = Timer(splashDuration, () {
      _isFinished = true;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
