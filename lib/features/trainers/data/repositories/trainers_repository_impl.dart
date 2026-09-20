import '../../../../core/error/failure.dart';
import '../../../../core/shared/models/trainers_model.dart';
import '../datasources/trainers_local_data_source.dart';
import 'trainers_repository.dart';

class TrainersRepositoryImpl implements TrainersRepository {
  final TrainersLocalDataSource _localDataSource;

  const TrainersRepositoryImpl(this._localDataSource);

  @override
  Future<List<TrainersModel>> getTrainers() async {
    try {
      return await _localDataSource.getTrainers();
    } catch (e) {
      throw UnexpectedFailure('Failed to load trainers: $e');
    }
  }
}
