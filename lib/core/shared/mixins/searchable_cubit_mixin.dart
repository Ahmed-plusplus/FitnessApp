import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

mixin SearchableCubitMixin<S> on Cubit<S> {
  static const Duration _debounceDuration = Duration(milliseconds: 500);

  Timer? _debounce;

  S onSearch(String query);

  void search(String query) {
    _debounce?.cancel();
    _debounce = Timer(_debounceDuration, () => emit(onSearch(query)));
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
