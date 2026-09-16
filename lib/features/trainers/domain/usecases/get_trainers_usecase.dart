import '../../../../core/shared/models/trainers_model.dart';
import '../repositories/trainers_repository.dart';

class GetTrainersUseCase {
  final TrainersRepository _repository;

  const GetTrainersUseCase(this._repository);

  Future<List<TrainersModel>> call() => _repository.getTrainers();
}
