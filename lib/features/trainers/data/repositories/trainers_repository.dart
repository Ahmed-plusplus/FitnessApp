import '../../../../core/shared/models/trainers_model.dart';

abstract class TrainersRepository {
  Future<List<TrainersModel>> getTrainers();
}
