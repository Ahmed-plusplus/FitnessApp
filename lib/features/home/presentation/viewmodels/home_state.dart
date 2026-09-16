import 'package:flutter/foundation.dart';

import '../../../../core/shared/models/plans_model.dart';

enum HomeStatus {
  initial,
  loading,
  loaded,
  failure,
}

@immutable
class HomeState {
  final HomeStatus status;
  final List<PlansModel> featuredPlans;
  final Set<int> favoritePlanIds;
  final String searchQuery;
  final String? errorMessage;

  const HomeState({
    this.status = HomeStatus.initial,
    this.featuredPlans = const [],
    this.favoritePlanIds = const {},
    this.searchQuery = '',
    this.errorMessage,
  });

  bool get isLoading => status == HomeStatus.loading;
  bool get isLoaded => status == HomeStatus.loaded;

  bool isPlanFavorite(int? planId) =>
      planId != null && favoritePlanIds.contains(planId);

  List<PlansModel> get visiblePlans {
    final query = searchQuery.trim().toLowerCase();
    if (query.isEmpty) return featuredPlans;
    return featuredPlans
        .where((plan) => (plan.name ?? '').toLowerCase().contains(query))
        .toList();
  }

  HomeState copyWith({
    HomeStatus? status,
    List<PlansModel>? featuredPlans,
    Set<int>? favoritePlanIds,
    String? searchQuery,
    String? errorMessage,
    bool clearErrorMessage = false,
  }) {
    return HomeState(
      status: status ?? this.status,
      featuredPlans: featuredPlans ?? this.featuredPlans,
      favoritePlanIds: favoritePlanIds ?? this.favoritePlanIds,
      searchQuery: searchQuery ?? this.searchQuery,
      errorMessage:
          clearErrorMessage ? null : (errorMessage ?? this.errorMessage),
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is HomeState &&
            other.status == status &&
            listEquals(other.featuredPlans, featuredPlans) &&
            setEquals(other.favoritePlanIds, favoritePlanIds) &&
            other.searchQuery == searchQuery &&
            other.errorMessage == errorMessage;
  }

  @override
  int get hashCode => Object.hash(
        status,
        Object.hashAll(featuredPlans),
        Object.hashAll(favoritePlanIds),
        searchQuery,
        errorMessage,
      );
}
