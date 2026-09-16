import '../../../../core/shared/models/plans_model.dart';

abstract class HomeRepository {
  Future<List<PlansModel>> getFeaturedPlans();

  Future<Set<int>> getFavoritePlanIds();

  Future<Set<int>> toggleFavoritePlan(int planId);
}
