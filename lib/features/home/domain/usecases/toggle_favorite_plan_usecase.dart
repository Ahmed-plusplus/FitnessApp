import '../repositories/home_repository.dart';

class ToggleFavoritePlanUseCase {
  final HomeRepository _repository;

  const ToggleFavoritePlanUseCase(this._repository);

  Future<Set<int>> call(int planId) => _repository.toggleFavoritePlan(planId);
}
