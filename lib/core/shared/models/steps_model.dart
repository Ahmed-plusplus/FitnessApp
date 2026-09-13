class StepsModel {
  int? day;
  int? duration;
  String? reps;
  int? week;
  String? workoutName;

  StepsModel({this.day, this.duration, this.reps, this.week, this.workoutName});

  StepsModel.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    duration = json['duration'];
    reps = json['reps'];
    week = json['week'];
    workoutName = json['workoutName'];
  }

  Map<String, dynamic> toJson() => {
    'day': day,
    'duration': duration,
    'reps': reps,
    'week': week,
    'workoutName': workoutName
  };
}