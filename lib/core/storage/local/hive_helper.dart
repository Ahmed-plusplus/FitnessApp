import 'package:hive_flutter/hive_flutter.dart';

class HiveHelper {
  static const String _favoritePlansBox = 'favorite_plans';

  Future<void> init() async {
    await Hive.initFlutter();
  }

  Future<void> saveFavoritePlan(
    String planId,
    Map<String, dynamic> planData,
  ) async {
    final box = await Hive.openBox<Map>(_favoritePlansBox);

    await box.put(planId, planData);
  }

  Future<void> updateFavoritePlan(
    String planId,
    Map<String, dynamic> planData,
  ) async {
    final box = await Hive.openBox<Map>(_favoritePlansBox);

    await box.put(planId, planData);
  }

  Future<Map<String, dynamic>?> getFavoritePlan(String planId) async {
    final box = await Hive.openBox<Map>(_favoritePlansBox);

    final plan = box.get(planId);

    if (plan == null) {
      return null;
    }

    return Map<String, dynamic>.from(plan);
  }

  Future<List<Map<String, dynamic>>> getFavoritePlans() async {
    final box = await Hive.openBox<Map>(_favoritePlansBox);

    return box.values.map((plan) => Map<String, dynamic>.from(plan)).toList();
  }

  Future<void> removeFavoritePlan(String planId) async {
    final box = await Hive.openBox<Map>(_favoritePlansBox);

    await box.delete(planId);
  }

  Future<bool> isFavoritePlan(String planId) async {
    final box = await Hive.openBox<Map>(_favoritePlansBox);

    return box.containsKey(planId);
  }

  Future<void> clearFavoritePlans() async {
    final box = await Hive.openBox<Map>(_favoritePlansBox);

    await box.clear();
  }
}
