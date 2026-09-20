import '../../../../core/shared/models/plans_model.dart';
import '../../../../core/storage/local/cache_helper.dart';

abstract class HomeLocalDataSource {
  Future<List<PlansModel>> getFeaturedPlans();

  Future<Set<int>> getFavoritePlanIds();

  Future<Set<int>> toggleFavoritePlanId(int planId);
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  final CacheHelper _cacheHelper;

  const HomeLocalDataSourceImpl(this._cacheHelper);

  @override
  Future<List<PlansModel>> getFeaturedPlans() async {
    return _seedFeaturedPlans;
  }

  @override
  Future<Set<int>> getFavoritePlanIds() async {
    final storedIds = await _cacheHelper.read<List<dynamic>>(
      CacheHelper.favoritePlanIdsKey,
    );
    if (storedIds == null) return <int>{};
    return storedIds.map((id) => id as int).toSet();
  }

  @override
  Future<Set<int>> toggleFavoritePlanId(int planId) async {
    final favoriteIds = await getFavoritePlanIds();
    if (!favoriteIds.remove(planId)) {
      favoriteIds.add(planId);
    }
    await _cacheHelper.write<List<int>>(
      CacheHelper.favoritePlanIdsKey,
      favoriteIds.toList(),
    );
    return favoriteIds;
  }

  static final List<PlansModel> _seedFeaturedPlans = [
    PlansModel(
      id: 1,
      name: 'Full Body Power',
      description: 'High-intensity functional movements designed to build '
          'raw strength across your entire body.',
      level: 'Intermediate',
      durationWeeks: 6,
      image: 'https://picsum.photos/seed/marcus-chen/200/200',
    ),
    PlansModel(
      id: 2,
      name: 'IronPulse Strength Phase',
      description: 'A high-intensity program designed for maximum muscle '
          'hypertrophy and strength gains. Focuses on compound movements '
          'and progressive overload.',
      level: 'Advanced',
      durationWeeks: 8,
      image: 'https://picsum.photos/seed/marcus-chen/200/200',
    ),
  ];
}
