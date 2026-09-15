import 'trainers_model.dart';

class TrainersResponse {
  List<TrainersModel>? trainers;

  TrainersResponse({this.trainers});

  TrainersResponse.fromJson(Map<String, dynamic> json) {
    if (json['trainers'] != null) {
      trainers = [];
      json['trainers'].forEach((v) {
        trainers!.add(TrainersModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() => {
      'trainers': trainers?.map((v) => v.toJson()).toList()
  };
}