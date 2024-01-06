import 'package:stud_advice/src/models/stud_advice/pageable.dart';

class Faq {
  late List<FaqContent> content;
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

  Faq(
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

  Faq.fromJson(Map<String, dynamic> json) {
    if (json['content'] != null) {
      content = <FaqContent>[];
      json['content'].forEach((v) {
        content.add(FaqContent.fromJson(v));
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

class FaqContent {
  late String id;
  late String question;
  late String response;
  String? imageId;

  FaqContent(
      {required this.id,
        required this.question,
        required this.response,
        this.imageId,
      });

  FaqContent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    response = json['response'];
    imageId = json['imageId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['question'] = question;
    data['response'] = response;
    data['imageId'] = imageId;
    return data;
  }
}
