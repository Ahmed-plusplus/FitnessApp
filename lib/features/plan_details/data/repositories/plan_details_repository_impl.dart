import '../../../../core/error/failure.dart';
import '../datasources/plan_details_local_data_source.dart';
import '../models/plan_details_model.dart';
import 'plan_details_repository.dart';

class PlanDetailsRepositoryImpl implements PlanDetailsRepository {
  final PlanDetailsLocalDataSource _localDataSource;

  const PlanDetailsRepositoryImpl(this._localDataSource);

  @override
  Future<PlanDetailsModel> getPlanDetails(int planId) async {
    try {
      final plan = await _localDataSource.getPlanDetails(planId);
      if (plan == null) {
        throw const NotFoundFailure('This plan could not be found.');
      }
      return plan;
    } on Failure {
      rethrow;
    } catch (_) {
      throw const UnexpectedFailure('Failed to load plan details.');
    }
  }

  @override
  Future<bool> isPlanFavorite(int planId) async {
    try {
      return await _localDataSource.isPlanFavorite(planId);
    } catch (_) {
      throw const CacheFailure('Failed to load favorite status.');
    }
  }

  @override
  Future<bool> toggleFavoritePlan(int planId) async {
    try {
      return await _localDataSource.toggleFavoritePlan(planId);
    } catch (_) {
      throw const CacheFailure('Failed to update favorite plan.');
    }
  }
}
