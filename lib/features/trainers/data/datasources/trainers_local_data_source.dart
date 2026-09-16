import '../../../../core/shared/models/trainers_model.dart';

abstract class TrainersLocalDataSource {
  Future<List<TrainersModel>> getTrainers();
}

class TrainersLocalDataSourceImpl implements TrainersLocalDataSource {
  const TrainersLocalDataSourceImpl();

  @override
  Future<List<TrainersModel>> getTrainers() async {
    return _seedTrainers;
  }

  static final List<TrainersModel> _seedTrainers = [
    TrainersModel(
      name: 'Marcus Chen',
      specialty: 'Strength & Conditioning',
      experienceYears: 8,
      rating: 4.9,
      image: 'https://picsum.photos/seed/marcus-chen/200/200',
    ),
    
  ];
}
