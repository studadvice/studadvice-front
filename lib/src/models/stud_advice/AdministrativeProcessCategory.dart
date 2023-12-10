class AdministrativeProcessCategory {
  List<CategoryContent>? content;
  Pageable? pageable;
  late int totalElements;
  int? totalPages;
  late bool last;
  int? size;
  int? number;
  Sort? sort;
  int? numberOfElements;
  bool? first;
  bool? empty;

  AdministrativeProcessCategory(
      {this.content,
        this.pageable,
        required this.totalElements,
        this.totalPages,
        required this.last,
        this.size,
        this.number,
        this.sort,
        this.numberOfElements,
        this.first,
        this.empty});

  AdministrativeProcessCategory.fromJson(Map<String, dynamic> json) {
    if (json['content'] != null) {
      content = <CategoryContent>[];
      json['content'].forEach((v) {
        content!.add(new CategoryContent.fromJson(v));
      });
    }
    pageable = json['pageable'] != null
        ? new Pageable.fromJson(json['pageable'])
        : null;
    totalElements = json['totalElements'];
    totalPages = json['totalPages'];
    last = json['last'];
    size = json['size'];
    number = json['number'];
    sort = json['sort'] != null ? new Sort.fromJson(json['sort']) : null;
    numberOfElements = json['numberOfElements'];
    first = json['first'];
    empty = json['empty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.content != null) {
      data['content'] = this.content!.map((v) => v.toJson()).toList();
    }
    if (this.pageable != null) {
      data['pageable'] = this.pageable!.toJson();
    }
    data['totalElements'] = this.totalElements;
    data['totalPages'] = this.totalPages;
    data['last'] = this.last;
    data['size'] = this.size;
    data['number'] = this.number;
    if (this.sort != null) {
      data['sort'] = this.sort!.toJson();
    }
    data['numberOfElements'] = this.numberOfElements;
    data['first'] = this.first;
    data['empty'] = this.empty;
    return data;
  }
}

class CategoryContent {
  String? id;
  String? name;
  String? description;
  String? imageId;
  List<AdministrativeProcesses>? administrativeProcesses;

  CategoryContent(
      {this.id,
        this.name,
        this.description,
        this.imageId,
        this.administrativeProcesses});

  CategoryContent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    imageId = json['imageId'];
    if (json['administrativeProcesses'] != null) {
      administrativeProcesses = <AdministrativeProcesses>[];
      json['administrativeProcesses'].forEach((v) {
        administrativeProcesses!.add(new AdministrativeProcesses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['imageId'] = this.imageId;
    if (this.administrativeProcesses != null) {
      data['administrativeProcesses'] =
          this.administrativeProcesses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AdministrativeProcesses {
  String? id;
  String? name;
  String? description;
  String? imageId;
  List<String>? educations;
  int? minAge;
  int? maxAge;
  List<String>? nationalities;
  List<String>? universities;
  List<Steps>? steps;

  AdministrativeProcesses(
      {this.id,
        this.name,
        this.description,
        this.imageId,
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
        steps!.add(new Steps.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['imageId'] = this.imageId;
    data['educations'] = this.educations;
    data['minAge'] = this.minAge;
    data['maxAge'] = this.maxAge;
    data['nationalities'] = this.nationalities;
    data['universities'] = this.universities;
    if (this.steps != null) {
      data['steps'] = this.steps!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Steps {
  int? stepNumber;
  String? name;
  String? description;
  Null? imageId;
  List<RequiredDocuments>? requiredDocuments;
  Null? resources;

  Steps(
      {this.stepNumber,
        this.name,
        this.description,
        this.imageId,
        this.requiredDocuments,
        this.resources});

  Steps.fromJson(Map<String, dynamic> json) {
    stepNumber = json['stepNumber'];
    name = json['name'];
    description = json['description'];
    imageId = json['imageId'];
    if (json['requiredDocuments'] != null) {
      requiredDocuments = <RequiredDocuments>[];
      json['requiredDocuments'].forEach((v) {
        requiredDocuments!.add(new RequiredDocuments.fromJson(v));
      });
    }
    resources = json['resources'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stepNumber'] = this.stepNumber;
    data['name'] = this.name;
    data['description'] = this.description;
    data['imageId'] = this.imageId;
    if (this.requiredDocuments != null) {
      data['requiredDocuments'] =
          this.requiredDocuments!.map((v) => v.toJson()).toList();
    }
    data['resources'] = this.resources;
    return data;
  }
}

class RequiredDocuments {
  String? id;
  String? name;
  String? description;
  Null? imageId;
  Null? url;

  RequiredDocuments(
      {this.id, this.name, this.description, this.imageId, this.url});

  RequiredDocuments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    imageId = json['imageId'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['imageId'] = this.imageId;
    data['url'] = this.url;
    return data;
  }
}

class Pageable {
  int? pageNumber;
  int? pageSize;
  Sort? sort;
  int? offset;
  bool? paged;
  bool? unpaged;

  Pageable(
      {this.pageNumber,
        this.pageSize,
        this.sort,
        this.offset,
        this.paged,
        this.unpaged});

  Pageable.fromJson(Map<String, dynamic> json) {
    pageNumber = json['pageNumber'];
    pageSize = json['pageSize'];
    sort = json['sort'] != null ? new Sort.fromJson(json['sort']) : null;
    offset = json['offset'];
    paged = json['paged'];
    unpaged = json['unpaged'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pageNumber'] = this.pageNumber;
    data['pageSize'] = this.pageSize;
    if (this.sort != null) {
      data['sort'] = this.sort!.toJson();
    }
    data['offset'] = this.offset;
    data['paged'] = this.paged;
    data['unpaged'] = this.unpaged;
    return data;
  }
}

class Sort {
  bool? empty;
  bool? sorted;
  bool? unsorted;

  Sort({this.empty, this.sorted, this.unsorted});

  Sort.fromJson(Map<String, dynamic> json) {
    empty = json['empty'];
    sorted = json['sorted'];
    unsorted = json['unsorted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['empty'] = this.empty;
    data['sorted'] = this.sorted;
    data['unsorted'] = this.unsorted;
    return data;
  }
}
