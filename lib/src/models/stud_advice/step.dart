import 'package:stud_advice/stud_advice.dart';

class Step {
  late int stepNumber;
  late String name;
  late String description;
  String? imageId;
  List<RequiredDocument>? requiredDocuments;

  Step(
      {required this.stepNumber,
      required this.name,
      required this.description,
      this.imageId,
      this.requiredDocuments});

  Step.fromJson(Map<String, dynamic> json) {
    stepNumber = json['stepNumber'];
    name = json['name'];
    description = json['description'];
    imageId = json['imageId'];
    if (json['requiredDocuments'] != null) {
      requiredDocuments = <RequiredDocument>[];
      json['requiredDocuments'].forEach((v) {
        requiredDocuments!.add(RequiredDocument.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['stepNumber'] = stepNumber;
    data['name'] = name;
    data['description'] = description;
    data['imageId'] = imageId;
    if (requiredDocuments != null) {
      data['requiredDocuments'] =
          requiredDocuments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
