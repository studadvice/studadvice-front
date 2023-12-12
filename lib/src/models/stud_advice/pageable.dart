class Pageable {
  late int pageNumber;
  late int pageSize;
  late Sort sort;
  late int offset;
  late bool paged;
  late bool unpaged;

  Pageable(
      {required this.pageNumber,
      required this.pageSize,
      required this.sort,
      required this.offset,
      required this.paged,
      required this.unpaged});

  Pageable.fromJson(Map<String, dynamic> json) {
    pageNumber = json['pageNumber'];
    pageSize = json['pageSize'];
    sort = (json['sort'] != null ? Sort.fromJson(json['sort']) : null)!;
    offset = json['offset'];
    paged = json['paged'];
    unpaged = json['unpaged'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pageNumber'] = pageNumber;
    data['pageSize'] = pageSize;
    data['sort'] = sort.toJson();
    data['offset'] = offset;
    data['paged'] = paged;
    data['unpaged'] = unpaged;
    return data;
  }
}

class Sort {
  late bool empty;
  late bool sorted;
  late bool unsorted;

  Sort({required this.empty, required this.sorted, required this.unsorted});

  Sort.fromJson(Map<String, dynamic> json) {
    empty = json['empty'];
    sorted = json['sorted'];
    unsorted = json['unsorted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['empty'] = empty;
    data['sorted'] = sorted;
    data['unsorted'] = unsorted;
    return data;
  }
}
