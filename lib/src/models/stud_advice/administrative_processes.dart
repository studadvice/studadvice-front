import 'package:stud_advice/src/models/stud_advice/pageable.dart';
import 'package:stud_advice/stud_advice.dart';

class AdministrativeProcesses {
  late List<AdministrativeProcessContent> content;
  late Pageable pageable;
  late int totalElements;
  late int totalPages;
  late bool last;
  late int size;
  late int number;
  late Sort sort;
  late int numberOfElements;
  late bool first;
  late bool empty;

  AdministrativeProcesses(
      {required this.content,
      required this.pageable,
      required this.totalElements,
      required this.totalPages,
      required this.last,
      required this.size,
      required this.number,
      required this.sort,
      required this.numberOfElements,
      required this.first,
      required this.empty});

  AdministrativeProcesses.fromJson(Map<String, dynamic> json) {
    if (json['content'] != null) {
      content = <AdministrativeProcessContent>[];
      json['content'].forEach((v) {
        content.add(AdministrativeProcessContent.fromJson(v));
      });
    }
    pageable = (json['pageable'] != null
        ? Pageable.fromJson(json['pageable'])
        : null)!;
    totalElements = json['totalElements'];
    totalPages = json['totalPages'];
    last = json['last'];
    size = json['size'];
    number = json['number'];
    sort = (json['sort'] != null ? Sort.fromJson(json['sort']) : null)!;
    numberOfElements = json['numberOfElements'];
    first = json['first'];
    empty = json['empty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['content'] = content.map((v) => v.toJson()).toList();
    data['pageable'] = pageable.toJson();
    data['totalElements'] = totalElements;
    data['totalPages'] = totalPages;
    data['last'] = last;
    data['size'] = size;
    data['number'] = number;
    data['sort'] = sort.toJson();
    data['numberOfElements'] = numberOfElements;
    data['first'] = first;
    data['empty'] = empty;
    return data;
  }
}

class AdministrativeProcessContent {
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

  AdministrativeProcessContent(
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

  AdministrativeProcessContent.fromJson(Map<String, dynamic> json) {
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
