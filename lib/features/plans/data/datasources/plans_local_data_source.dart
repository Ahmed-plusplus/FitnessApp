import '../../../../core/shared/models/plans_model.dart';

abstract class PlansLocalDataSource {
  Future<List<PlansModel>> getPlans();
}

class PlansLocalDataSourceImpl implements PlansLocalDataSource {
  const PlansLocalDataSourceImpl();

  @override
  Future<List<PlansModel>> getPlans() async {
    return _seedPlans;
  }

  static final List<PlansModel> _seedPlans = [
    PlansModel(
      id: 1,
      name: 'Alpha Strength',
      description: 'High-intensity functional movements designed to build '
          'raw strength across your entire body.',
      level: 'Advanced',
      durationWeeks: 8,
      image: 'https://picsum.photos/seed/marcus-chen/200/200',
    ),
  ];
}
