import '../../../../core/shared/models/plans_model.dart';

abstract class PlansRepository {
  Future<List<PlansModel>> getPlans();
}
