import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failure.dart';
import '../../data/repositories/plans_repository.dart';
import 'plans_state.dart';

class PlansViewModel extends Cubit<PlansState> {
  final PlansRepository _repository;

  PlansViewModel(this._repository) : super(const PlansState());

  Future<void> loadPlans() async {
    emit(state.copyWith(status: PlansStatus.loading, clearErrorMessage: true));

    try {
      final plans = await _repository.getPlans();

      emit(state.copyWith(
        status: PlansStatus.loaded,
        plans: plans,
        clearErrorMessage: true,
      ));
    } catch (error) {
      emit(state.copyWith(
        status: PlansStatus.failure,
        errorMessage: _messageFor(error),
      ));
    }
  }

  String _messageFor(Object error) {
    return error is Failure
        ? error.message
        : 'Something went wrong. Please try again.';
  }
}
