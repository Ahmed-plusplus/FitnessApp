class TrainersModel {
  int? experienceYears;
  String? image;
  String? name;
  double? rating;
  String? specialty;

  TrainersModel(
      {this.experienceYears,
        this.image,
        this.name,
        this.rating,
        this.specialty});

  TrainersModel.fromJson(Map<String, dynamic> json) {
    experienceYears = json['experienceYears'];
    image = json['image'];
    name = json['name'];
    rating = json['rating'];
    specialty = json['specialty'];
  }

  Map<String, dynamic> toJson() => {
    'experienceYears': experienceYears,
    'image': image,
    'name': name,
    'rating': rating,
    'specialty': specialty
  };
}
