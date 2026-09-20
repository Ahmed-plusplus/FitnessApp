import 'plan_day_model.dart';

class PlanWeekModel {
  final int number;
  final String title;
  final List<PlanDayModel> days;

  const PlanWeekModel({
    required this.number,
    required this.title,
    required this.days,
  });
}
