class AdministrativeProcessCategory {
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

  AdministrativeProcessCategory(
      {
        required this.content,
        required this.pageable,
        required this.totalElements,
        required this.totalPages,
        required this.last,
        required this.size,
        required this.number,
        required this.sort,
        required this.numberOfElements,
        required this.first,
        required this.empty
      });

  AdministrativeProcessCategory.fromJson(Map<String, dynamic> json) {
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
  List<AdministrativeProcesses>? administrativeProcesses;

  CategoryContent(
      {
        required this.id,
        required this.name,
        required this.description,
        required this.imageId,
        this.administrativeProcesses});

  CategoryContent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    imageId = json['imageId'];
    if (json['administrativeProcesses'] != null) {
      administrativeProcesses = <AdministrativeProcesses>[];
      json['administrativeProcesses'].forEach((v) {
        administrativeProcesses!.add(AdministrativeProcesses.fromJson(v));
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

class AdministrativeProcesses {
  late String id;
  late String name;
  late String description;
  late String imageId;
  List<String>? educations;
  int? minAge;
  int? maxAge;
  List<String>? nationalities;
  List<String>? universities;
  List<Steps>? steps;

  AdministrativeProcesses(
      {
        required this.id,
        required this.name,
        required this.description,
        required this.imageId,
        this.educations,
        this.minAge,
        this.maxAge,
        this.nationalities,
        this.universities,
        this.steps});

  AdministrativeProcesses.fromJson(Map<String, dynamic> json) {
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
      steps = <Steps>[];
      json['steps'].forEach((v) {
        steps!.add(Steps.fromJson(v));
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

class Steps {
  late int stepNumber;
  late String name;
  late String description;
  String? imageId;
  List<RequiredDocuments>? requiredDocuments;

  Steps(
      {
        required this.stepNumber,
        required this.name,
        required this.description,
        this.imageId,
        this.requiredDocuments
      });

  Steps.fromJson(Map<String, dynamic> json) {
    stepNumber = json['stepNumber'];
    name = json['name'];
    description = json['description'];
    imageId = json['imageId'];
    if (json['requiredDocuments'] != null) {
      requiredDocuments = <RequiredDocuments>[];
      json['requiredDocuments'].forEach((v) {
        requiredDocuments!.add(RequiredDocuments.fromJson(v));
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

class RequiredDocuments {
  late String id;
  late String name;
  late String description;
  String? imageId;
  String? url;

  RequiredDocuments(
      {
        required this.id,
        required this.name,
        required this.description,
        this.imageId,
        this.url});

  RequiredDocuments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    imageId = json['imageId'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['imageId'] = imageId;
    data['url'] = url;
    return data;
  }
}

class Pageable {
  late int pageNumber;
  late int pageSize;
  late Sort sort;
  late int offset;
  late bool paged;
  late bool unpaged;

  Pageable(
      {
        required this.pageNumber,
        required this.pageSize,
        required this.sort,
        required this.offset,
        required this.paged,
        required this.unpaged
      });

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

  Sort(
      {
        required this.empty,
        required this.sorted,
        required this.unsorted
      });

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
