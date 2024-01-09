import 'package:stud_advice/src/models/stud_advice/resource.dart';
import 'package:stud_advice/stud_advice.dart';
import 'package:flutter/material.dart';

class StepItem {
  late int stepNumber;
  late String name;
  late String description;
  Color? color;
  Color? borderColor;
  bool? isCompleted;
  String? imageId;
  List<Resource>? resources;
  List<RequiredDocument>? requiredDocuments;

  StepItem(
      {required this.stepNumber,
      required this.name,
      required this.description,
      this.borderColor,
      this.color,
      this.isCompleted,
      this.imageId,
      this.requiredDocuments});

  StepItem.fromJson(Map<String, dynamic> json) {
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
    if (json['resources'] != null) {
      resources = <Resource>[];
      json['resources'].forEach((v) {
        resources!.add(Resource.fromJson(v));
      });
    }
    isCompleted = false;
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
    if (resources != null) {
      data['resources'] =
          resources!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
