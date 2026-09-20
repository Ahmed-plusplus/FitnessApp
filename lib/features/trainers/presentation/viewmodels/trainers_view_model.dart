import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/shared/mixins/searchable_cubit_mixin.dart';
import '../../data/repositories/trainers_repository.dart';
import 'trainers_state.dart';

class TrainersViewModel extends Cubit<TrainersState>
    with SearchableCubitMixin<TrainersState> {
  final TrainersRepository _repository;

  TrainersViewModel(this._repository) : super(const TrainersState());

  Future<void> loadTrainers() async {
    emit(
      state.copyWith(status: TrainersStatus.loading, clearErrorMessage: true),
    );

    try {
      final trainers = await _repository.getTrainers();

      emit(state.copyWith(
        status: TrainersStatus.loaded,
        trainers: trainers,
        clearErrorMessage: true,
      ));
    } catch (error) {
      emit(state.copyWith(
        status: TrainersStatus.failure,
        errorMessage: _messageFor(error),
      ));
    }
  }

  @override
  TrainersState onSearch(String query) => state.copyWith(searchQuery: query);

  String _messageFor(Object error) {
    return error is Failure
        ? error.message
        : 'Something went wrong. Please try again.';
  }
}
