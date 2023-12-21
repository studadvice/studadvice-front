import 'package:stud_advice/src/models/stud_advice/pageable.dart';

import 'administrative_process.dart';

class Category {
  late List<CategoryContent> content;
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

  Category(
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

  Category.fromJson(Map<String, dynamic> json) {
    if (json['content'] != null) {
      content = <CategoryContent>[];
      json['content'].forEach((v) {
        content.add(CategoryContent.fromJson(v));
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

class CategoryContent {
  late String id;
  late String name;
  late String description;
  late String imageId;
  late String color;
  List<AdministrativeProcess>? administrativeProcesses;

  CategoryContent(
      {required this.id,
        required this.name,
        required this.description,
        required this.imageId,
        required this.color,
        this.administrativeProcesses});

  CategoryContent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    imageId = json['imageId'];
    color = json["color"];
    if (json['administrativeProcesses'] != null) {
      administrativeProcesses = <AdministrativeProcess>[];
      json['administrativeProcesses'].forEach((v) {
        administrativeProcesses!.add(AdministrativeProcess.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['imageId'] = imageId;
    if (administrativeProcesses != null) {
      data['administrativeProcesses'] =
          administrativeProcesses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
