import '../../../../core/storage/local/cache_helper.dart';
import '../models/plan_day_model.dart';
import '../models/plan_details_model.dart';
import '../models/plan_exercise_model.dart';
import '../models/plan_week_model.dart';

abstract class PlanDetailsLocalDataSource {
  Future<PlanDetailsModel?> getPlanDetails(int planId);

  Future<bool> isPlanFavorite(int planId);

  Future<bool> toggleFavoritePlan(int planId);
}

class PlanDetailsLocalDataSourceImpl implements PlanDetailsLocalDataSource {
  final CacheHelper _cacheHelper;

  const PlanDetailsLocalDataSourceImpl(this._cacheHelper);

  @override
  Future<PlanDetailsModel?> getPlanDetails(int planId) async {
    for (final plan in _seedPlans) {
      if (plan.id == planId) return plan;
    }
    return null;
  }

  @override
  Future<bool> isPlanFavorite(int planId) async {
    final favoriteIds = await _readFavoriteIds();
    return favoriteIds.contains(planId);
  }

  @override
  Future<bool> toggleFavoritePlan(int planId) async {
    final favoriteIds = await _readFavoriteIds();
    final isNowFavorite = !favoriteIds.remove(planId);
    if (isNowFavorite) favoriteIds.add(planId);

    await _cacheHelper.write<List<int>>(
      CacheHelper.favoritePlanIdsKey,
      favoriteIds.toList(),
    );
    return isNowFavorite;
  }

  Future<Set<int>> _readFavoriteIds() async {
    final storedIds = await _cacheHelper.read<List<dynamic>>(
      CacheHelper.favoritePlanIdsKey,
    );
    if (storedIds == null) return <int>{};
    return storedIds.map((id) => id as int).toSet();
  }

  static const List<PlanDetailsModel> _seedPlans = [
    PlanDetailsModel(
      id: 1,
      name: 'Full Body Power',
      description: 'High-intensity functional movements designed to build '
          'raw strength across your entire body.',
      image: 'https://picsum.photos/seed/marcus-chen/200/200',
      level: 'Intermediate',
      durationWeeks: 6,
      minSessionMinutes: 45,
      maxSessionMinutes: 60,
      daysPerWeek: 4,
      intensity: 'Medium',
      weeks: [
        PlanWeekModel(
          number: 1,
          title: 'Foundations',
          days: [
            PlanDayModel(
              number: 1,
              title: 'Full Body A: Squat Focus',
              exercises: [
                PlanExerciseModel(name: 'Barbell Back Squat', sets: 4, reps: 8),
                PlanExerciseModel(name: 'Barbell Bench Press', sets: 3, reps: 10),
                PlanExerciseModel(name: 'Bent-Over Row', sets: 3, reps: 10),
              ],
            ),
            PlanDayModel(
              number: 2,
              title: 'Active Recovery',
              isRestDay: true,
            ),
            PlanDayModel(
              number: 3,
              title: 'Full Body B: Deadlift Focus',
              exercises: [
                PlanExerciseModel(name: 'Conventional Deadlift', sets: 4, reps: 6),
                PlanExerciseModel(name: 'Overhead Press', sets: 3, reps: 10),
                PlanExerciseModel(name: 'Pull-Ups', sets: 3, reps: 8),
              ],
            ),
          ],
        ),
      ],
    ),
  ];
}
