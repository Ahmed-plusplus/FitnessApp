import '../models/plan_details_model.dart';

abstract class PlanDetailsRepository {
  Future<PlanDetailsModel> getPlanDetails(int planId);

  Future<bool> isPlanFavorite(int planId);

  Future<bool> toggleFavoritePlan(int planId);
}
