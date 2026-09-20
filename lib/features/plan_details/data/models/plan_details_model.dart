import 'plan_week_model.dart';

class PlanDetailsModel {
  final int id;
  final String name;
  final String description;
  final String? image;
  final String level;
  final int durationWeeks;
  final int minSessionMinutes;
  final int maxSessionMinutes;
  final int daysPerWeek;
  final String intensity;
  final List<PlanWeekModel> weeks;

  const PlanDetailsModel({
    required this.id,
    required this.name,
    required this.description,
    required this.level,
    required this.durationWeeks,
    required this.minSessionMinutes,
    required this.maxSessionMinutes,
    required this.daysPerWeek,
    required this.intensity,
    this.image,
    this.weeks = const [],
  });
}
