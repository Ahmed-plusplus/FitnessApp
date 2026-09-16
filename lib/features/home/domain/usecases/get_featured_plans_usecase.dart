import '../../../../core/shared/models/plans_model.dart';
import '../repositories/home_repository.dart';

class GetFeaturedPlansUseCase {
  final HomeRepository _repository;

  const GetFeaturedPlansUseCase(this._repository);

  Future<List<PlansModel>> call() => _repository.getFeaturedPlans();
}
