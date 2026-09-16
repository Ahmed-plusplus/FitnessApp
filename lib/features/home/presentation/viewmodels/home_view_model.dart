import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/shared/mixins/searchable_cubit_mixin.dart';
import '../../domain/usecases/get_favorite_plan_ids_usecase.dart';
import '../../domain/usecases/get_featured_plans_usecase.dart';
import '../../domain/usecases/toggle_favorite_plan_usecase.dart';
import 'home_state.dart';

class HomeViewModel extends Cubit<HomeState>
    with SearchableCubitMixin<HomeState> {
  final GetFeaturedPlansUseCase _getFeaturedPlansUseCase;
  final GetFavoritePlanIdsUseCase _getFavoritePlanIdsUseCase;
  final ToggleFavoritePlanUseCase _toggleFavoritePlanUseCase;

  HomeViewModel(
    this._getFeaturedPlansUseCase,
    this._getFavoritePlanIdsUseCase,
    this._toggleFavoritePlanUseCase,
  ) : super(const HomeState());

  Future<void> loadHome() async {
    emit(state.copyWith(status: HomeStatus.loading, clearErrorMessage: true));

    try {
      final plans = await _getFeaturedPlansUseCase();
      final favoriteIds = await _getFavoritePlanIdsUseCase();

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
      final favoriteIds = await _toggleFavoritePlanUseCase(planId);
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
