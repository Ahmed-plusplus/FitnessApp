import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/shared/mixins/searchable_cubit_mixin.dart';
import '../../domain/usecases/get_trainers_usecase.dart';
import 'trainers_state.dart';

class TrainersViewModel extends Cubit<TrainersState>
    with SearchableCubitMixin<TrainersState> {
  final GetTrainersUseCase _getTrainersUseCase;

  TrainersViewModel(this._getTrainersUseCase) : super(const TrainersState());

  Future<void> loadTrainers() async {
    emit(
      state.copyWith(status: TrainersStatus.loading, clearErrorMessage: true),
    );

    try {
      final trainers = await _getTrainersUseCase();

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
