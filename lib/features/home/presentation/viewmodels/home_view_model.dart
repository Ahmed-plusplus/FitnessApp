import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/shared/mixins/searchable_cubit_mixin.dart';
import '../../data/repositories/home_repository.dart';
import 'home_state.dart';

class HomeViewModel extends Cubit<HomeState>
    with SearchableCubitMixin<HomeState> {
  final HomeRepository _repository;

  HomeViewModel(this._repository) : super(const HomeState());

  Future<void> loadHome() async {
    emit(state.copyWith(status: HomeStatus.loading, clearErrorMessage: true));

    try {
      final plans = await _repository.getFeaturedPlans();
      final favoriteIds = await _repository.getFavoritePlanIds();

      emit(state.copyWith(
        status: HomeStatus.loaded,
        featuredPlans: plans,
        favoritePlanIds: favoriteIds,
        clearErrorMessage: true,
      ));
    } catch (error) {
      emit(state.copyWith(
        status: HomeStatus.failure,
        errorMessage: _messageFor(error),
      ));
    }
  }

  Future<void> toggleFavorite(int planId) async {
    try {
      final favoriteIds = await _repository.toggleFavoritePlan(planId);
      emit(state.copyWith(favoritePlanIds: favoriteIds));
    } catch (error) {
      emit(state.copyWith(errorMessage: _messageFor(error)));
    }
  }

  @override
  HomeState onSearch(String query) => state.copyWith(searchQuery: query);

  String _messageFor(Object error) {
    return error is Failure
        ? error.message
        : 'Something went wrong. Please try again.';
  }
}
