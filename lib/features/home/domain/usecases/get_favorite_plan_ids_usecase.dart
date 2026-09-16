import '../repositories/home_repository.dart';

class GetFavoritePlanIdsUseCase {
  final HomeRepository _repository;

  const GetFavoritePlanIdsUseCase(this._repository);

  Future<Set<int>> call() => _repository.getFavoritePlanIds();
}
