import 'steps_model.dart';

class PlansModel {
  String? description;
  int? durationWeeks;
  int? id;
  String? image;
  String? level;
  String? name;
  List<StepsModel>? steps;

  PlansModel(
      {this.description,
        this.durationWeeks,
        this.id,
        this.image,
        this.level,
        this.name,
        this.steps});

  PlansModel.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    durationWeeks = json['durationWeeks'];
    id = json['id'];
    image = json['image'];
    level = json['level'];
    name = json['name'];
    if (json['steps'] != null) {
      steps = [];
      json['steps'].forEach((v) {
        steps!.add(StepsModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() => {
    'description': description,
    'durationWeeks': durationWeeks,
    'id': id,
    'image': image,
    'level': level,
    'name': name,
    'steps': steps?.map((v) => v.toJson()).toList()
  };
}
