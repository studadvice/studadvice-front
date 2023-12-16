import 'package:stud_advice/stud_advice.dart';

class AdministrativeProcess {
  late String id;
  late String name;
  late String description;
  late String imageId;
  List<String>? educations;
  int? minAge;
  int? maxAge;
  List<String>? nationalities;
  List<String>? universities;
  List<Step>? steps;
  String? imageFileSrc;
  bool? isFavorite;

  AdministrativeProcess(
      {required this.id,
      required this.name,
      required this.description,
      required this.imageId,
      this.isFavorite,
      this.educations,
      this.minAge,
      this.maxAge,
      this.nationalities,
      this.universities,
      this.steps});

  AdministrativeProcess.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    imageId = json['imageId'];
    educations = json['educations'].cast<String>();
    minAge = json['minAge'];
    maxAge = json['maxAge'];
    nationalities = json['nationalities'].cast<String>();
    universities = json['universities'].cast<String>();
    if (json['steps'] != null) {
      steps = <Step>[];
      json['steps'].forEach((v) {
        steps!.add(Step.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['imageId'] = imageId;
    data['educations'] = educations;
    data['minAge'] = minAge;
    data['maxAge'] = maxAge;
    data['nationalities'] = nationalities;
    data['universities'] = universities;
    if (steps != null) {
      data['steps'] = steps!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}