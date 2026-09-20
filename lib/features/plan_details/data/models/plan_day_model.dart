import 'plan_exercise_model.dart';

class PlanDayModel {
  final int number;
  final String title;
  final bool isRestDay;
  final List<PlanExerciseModel> exercises;

  const PlanDayModel({
    required this.number,
    required this.title,
    this.isRestDay = false,
    this.exercises = const [],
  });
}
