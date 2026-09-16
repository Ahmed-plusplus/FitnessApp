import '../../../../core/error/failure.dart';
import '../../../../core/shared/models/plans_model.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_local_data_source.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeLocalDataSource _localDataSource;

  const HomeRepositoryImpl(this._localDataSource);

  @override
  Future<List<PlansModel>> getFeaturedPlans() async {
    try {
      return await _localDataSource.getFeaturedPlans();
    } catch (e) {
      throw UnexpectedFailure('Failed to load featured plans: $e');
    }
  }

  @override
  Future<Set<int>> getFavoritePlanIds() async {
    try {
      return await _localDataSource.getFavoritePlanIds();
    } catch (e) {
      throw CacheFailure('Failed to load favorite plans: $e');
    }
  }

  @override
  Future<Set<int>> toggleFavoritePlan(int planId) async {
    try {
      return await _localDataSource.toggleFavoritePlanId(planId);
    } catch (e) {
      throw CacheFailure('Failed to update favorite plan: $e');
    }
  }
}
