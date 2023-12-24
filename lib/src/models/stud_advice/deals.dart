import 'package:stud_advice/src/models/stud_advice/pageable.dart';

class Deals {
  late List<DealContent> content;
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

  Deals(
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

  Deals.fromJson(Map<String, dynamic> json) {
    if (json['content'] != null) {
      content = <DealContent>[];
      json['content'].forEach((v) {
        content.add(DealContent.fromJson(v));
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

class DealContent {
  late String id;
  late String title;
  late String description;
  late String imageId;
  String? category;
  String? startDate;
  String? endDate;

  DealContent(
      {
        required this.id,
        required this.title,
        required this.description,
        required this.imageId,
        this.category,
        this.startDate,
        this.endDate
      });

  DealContent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    imageId = json['imageId'];
    category = json["category"];
    startDate = json['startDate'];
    endDate = json["endDate"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['imageId'] = imageId;
    data['category'] = category;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    return data;
  }
}
