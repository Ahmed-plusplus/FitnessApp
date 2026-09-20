import '../../../../core/error/failure.dart';
import '../../../../core/shared/models/plans_model.dart';
import '../datasources/plans_local_data_source.dart';
import 'plans_repository.dart';

class PlansRepositoryImpl implements PlansRepository {
  final PlansLocalDataSource _localDataSource;

  const PlansRepositoryImpl(this._localDataSource);

  @override
  Future<List<PlansModel>> getPlans() async {
    try {
      return await _localDataSource.getPlans();
    } catch (e) {
      throw UnexpectedFailure('Failed to load plans: $e');
    }
  }
}
